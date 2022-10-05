//
//  TeamDetailViewModelTests.swift
//  TabelaDaCopaTests
//
//  Created by Joan Wilson Oliveira on 01/10/22.
//

import XCTest
@testable import TabelaDaCopa

public final class TeamDetailViewModelTests: XCTestCase {

    private var sut: TeamDetailViewModel!

    public override func setUpWithError() throws {
        sut = TeamDetailViewModel()
    }

    public override func tearDownWithError() throws {
        sut = nil
    }

    public func test_getPlayerListFromAJSONFile_ShouldReturnAnError() {
        XCTAssertThrowsError(try sut.getPlayerListFromAJSONFile(for: "in", withExtension: "in")) { error in
            XCTAssertEqual(error as? PlayerListError, PlayerListError.invalidJsonURL)
        }
    }

    public func test_getAnArrayOfPlayersFromAJsonURL_ShouldReturnEmpty() {
        let invalidURL: URL = URL(string: "invalid")!
        let players: Players = sut.getAnArrayOfPlayersFromAJsonURL(invalidURL)
        XCTAssertEqual(players, [])
    }

}
