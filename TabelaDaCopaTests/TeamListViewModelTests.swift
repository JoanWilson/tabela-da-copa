//
//  TeamListViewModelTests.swift
//  TabelaDaCopaTests
//
//  Created by Joan Wilson Oliveira on 27/09/22.
//

import XCTest
@testable import TabelaDaCopa

public final class TeamListViewModelTests: XCTestCase {

    private var sut: TeamListViewModel!

    public override func setUpWithError() throws {
        sut = TeamListViewModel()
    }

    public override func tearDownWithError() throws {
        sut = nil
    }

    public func test_getTeamListFromAJSONFile_ShouldReturnAnURL() {
        let url = try? sut.getTeamListFromAJSONFile(for: "GroupTeams", withExtension: "json")
        XCTAssertNotNil(url)
    }

    public func test_getTeamListFromAJSONFile_ShouldReturnAnError() {
        XCTAssertThrowsError(try sut.getTeamListFromAJSONFile(for: "invalid", withExtension: "invalid")) { error in
            XCTAssertEqual(error as? TeamListError, TeamListError.invalidJsonURL)
        }
    }

    public func test_getAnArrayOfTeamsFromAJsonURL_ShouldReturnAnArrayOfTeams() {
        let validJsonUrl = (try? sut.getTeamListFromAJSONFile(for: "GroupTeams", withExtension: "json"))!
        let teamsArray: Teams? = sut.getAnArrayOfTeamsFromAJsonURL(validJsonUrl)
        XCTAssertNotNil(teamsArray)
    }

    public func test_getAnArrayOfTeamsFromAJsonURL_ShouldReturnEmpty() {
        let invalidURL: URL = URL(string: "invalid")!
        let teams: Teams = sut.getAnArrayOfTeamsFromAJsonURL(invalidURL)
        XCTAssertEqual(teams, [])
    }

    public func test_getTeamsFromAGroup() {
        let mockTeamA = [
            TeamElement(team: "Senegal", group: "A", flagIcon: "🇸🇳"),
            TeamElement(team: "Qatar", group: "A", flagIcon: "🇶🇦"),
            TeamElement(team: "Netherlands", group: "A", flagIcon: "🇳🇱"),
            TeamElement(team: "Ecuador", group: "A", flagIcon: "🇪🇨")
        ]

        let teams = sut.getTeamsFromAGroup(group: "A")
        XCTAssertEqual(teams, mockTeamA)
    }

    public func test_teamList_ShouldBeEmpty() {
        sut.jsonFileName = "invalid"
        sut.jsonFileExtension = "invalid"
        let teams: Teams = sut.teamList
        XCTAssertEqual(teams, [])
    }

}
