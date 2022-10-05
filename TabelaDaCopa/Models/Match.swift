//
//  Match.swift
//  TabelaDaCopa
//
//  Created by Joan Wilson Oliveira on 04/10/22.
//
//   let match = try? newJSONDecoder().decode(Match.self, from: jsonData)

import Foundation

struct Match: Codable {
    let matchNumber, roundNumber: Int
    let dateUTC, location, homeTeam, awayTeam: String
    let group: String?
    let homeTeamScore, awayTeamScore: JSONNull?

    enum CodingKeys: String, CodingKey {
        case matchNumber = "MatchNumber"
        case roundNumber = "RoundNumber"
        case dateUTC = "DateUtc"
        case location = "Location"
        case homeTeam = "HomeTeam"
        case awayTeam = "AwayTeam"
        case group = "Group"
        case homeTeamScore = "HomeTeamScore"
        case awayTeamScore = "AwayTeamScore"
    }
}

typealias Matches = [Match]

struct MatchesResult: Codable {
    let results: [Match]
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(0)
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self,
                                             DecodingError.Context(codingPath: decoder.codingPath,
                                                                   debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
