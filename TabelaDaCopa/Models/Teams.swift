//
//  Team.swift
//  TabelaDaCopa
//
//  Created by Joan Wilson Oliveira on 27/09/22.
//

import Foundation

public struct TeamElement: Codable, Equatable {
    let team: String
    let group: String
    let flagIcon: String

    enum CodingKeys: String, CodingKey {
        case team = "Team"
        case group = "Group"
        case flagIcon = "FlagIcon"
    }
}

public typealias Teams = [TeamElement]
