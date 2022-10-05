//
//  Player.swift
//  TabelaDaCopa
//
//  Created by Joan Wilson Oliveira on 01/10/22.
//   let players = try? newJSONDecoder().decode(Players.self, from: jsonData)

import Foundation

public struct Player: Codable, Equatable {
    let id, name, age: String
    let photo: String
    let nationality: String
    let flag: String
    let bestPosition: String

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case name = "Name"
        case age = "Age"
        case photo = "Photo"
        case nationality = "Nationality"
        case flag = "Flag"
        case bestPosition = "Best Position"
    }
}

public typealias Players = [Player]
