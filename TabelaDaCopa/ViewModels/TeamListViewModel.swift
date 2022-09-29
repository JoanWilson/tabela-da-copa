//
//  TeamListViewModel.swift
//  TabelaDaCopa
//
//  Created by Joan Wilson Oliveira on 27/09/22.
//

import Foundation
import UIKit

public enum TeamListError: Error {
    case invalidJsonURL
}

extension TeamListError: Equatable {
    public static func == (lhs: TeamListError, rhs: TeamListError) -> Bool {
        return true
    }
}

public final class TeamListViewModel {

    private let jsonDecoder: JSONDecoder!
    public var jsonFileName: String!
    public var jsonFileExtension: String!

    init() {
        self.jsonDecoder = JSONDecoder()
        self.jsonFileName = "GroupTeams"
        self.jsonFileExtension = "json"
    }

    public var teamList: Teams {
        do {
            let url: URL = try self.getTeamListFromAJSONFile(
                for: self.jsonFileName,
                withExtension: self.jsonFileExtension
            )
            return self.getAnArrayOfTeamsFromAJsonURL(url)
        } catch {
            return []
        }
    }

    public func getTeamListFromAJSONFile(for resource: String, withExtension extensionFile: String) throws -> URL {
        guard let jsonURL: URL = Bundle.main.url(forResource: resource, withExtension: extensionFile) else {
            throw TeamListError.invalidJsonURL
        }
        return jsonURL
    }

    public func getAnArrayOfTeamsFromAJsonURL(_ jsonURL: URL) -> Teams {
        do {
            let jsonData = try Data(contentsOf: jsonURL)
            let teams = try jsonDecoder.decode(Teams.self, from: jsonData)

            return teams
        } catch {

            return []
        }
    }

    public func getTeamsFromAGroup(group: String) -> Teams {
        let selectedGroup: String = group.capitalized
        var teamsFromSelectedGroup: Teams = []

        for team in self.teamList where team.group == selectedGroup {
            teamsFromSelectedGroup.append(team)
        }

        return teamsFromSelectedGroup
    }

}
