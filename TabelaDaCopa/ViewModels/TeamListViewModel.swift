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
    public var sectionsOfGroups: [Section] = [Section]()

    init() {
        self.jsonDecoder = JSONDecoder()
        self.jsonFileName = "GroupTeams"
        self.jsonFileExtension = "json"
        self.populateArrayOfSections()
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

    public func getNumberOfTeamsInAGroup(for group: String) -> Int {
        let teams = self.getTeamsFromAGroup(group: group)
        return teams.count
    }

    public func getAnArrayOfAllGroups() -> [Group] {
        let arrayOfGroupsNames: [String] = ["A", "B", "C", "D", "E", "F", "G", "H"]
        var arrayOfGroups: [Group] = []
        var arrayOfTeams: [String] = []
        var arrayOfFlags: [String] = []
        let arrayOfAllTeams = self.teamList
        for indexI in 0..<8 {
            for indexJ in arrayOfAllTeams where indexJ.group == arrayOfGroupsNames[indexI] {
                arrayOfTeams.append(indexJ.team)
                arrayOfFlags.append(indexJ.flagIcon)
            }
            arrayOfGroups.append(Group(name: arrayOfGroupsNames[indexI], teams: arrayOfTeams, flags: arrayOfFlags))
            arrayOfTeams = []
            arrayOfFlags = []
        }

        return arrayOfGroups
    }

    public func populateArrayOfSections() {
        let arrayOfAllGroups = self.getAnArrayOfAllGroups()
        for index in arrayOfAllGroups {
            self.sectionsOfGroups.append(Section(group: index.name, teams: index.teams, teamsFlags: index.flags))
        }
    }

}
