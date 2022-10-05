//
//  TeamDetailViewModel.swift
//  TabelaDaCopa
//
//  Created by Joan Wilson Oliveira on 01/10/22.
//

import Foundation

public enum PlayerListError: Error {
    case invalidJsonURL
}

extension PlayerListError: Equatable {
    public static func == (lhs: PlayerListError, rhs: PlayerListError) -> Bool {
        return true
    }
}

public final class TeamDetailViewModel {

    private let jsonDecoder: JSONDecoder!
    public var jsonFileName: String!
    public var jsonFileExtension: String!

    public var playerList: Players {
        do {
            let url: URL = try self.getPlayerListFromAJSONFile(
                for: self.jsonFileName,
                withExtension: self.jsonFileExtension
            )
            return self.getAnArrayOfPlayersFromAJsonURL(url)
        } catch {
            return []
        }
    }

    init() {
        self.jsonDecoder = JSONDecoder()
        self.jsonFileName = "Players"
        self.jsonFileExtension = "json"
    }

    public func getImageFlag(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }

    public func getPlayerListFromAJSONFile(for resource: String, withExtension extensionFile: String) throws -> URL {
        guard let jsonURL: URL = Bundle.main.url(forResource: resource, withExtension: extensionFile) else {
            throw TeamListError.invalidJsonURL
        }
        return jsonURL
    }

    public func getAnArrayOfPlayersFromAJsonURL(_ jsonURL: URL) -> Players {
        do {
            let jsonData = try Data(contentsOf: jsonURL)
            let players = try jsonDecoder.decode(Players.self, from: jsonData)

            return players
        } catch {
            return []
        }
    }

}
