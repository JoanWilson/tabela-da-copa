//
//  TeamDetailViewControllerTests.swift
//  TabelaDaCopaTests
//
//  Created by Joan Wilson Oliveira on 29/09/22.
//

import XCTest
@testable import TabelaDaCopa

public final class TeamDetailViewControllerTests: XCTestCase {

    private var sut: TeamDetailViewController!

    public override func setUpWithError() throws {
        sut = TeamDetailViewController()
    }

    public override func tearDownWithError() throws {
        sut = nil
    }

    public func test_viewDidLoad_MustCallBuildLayoutFromViewCodingProtocol() {
        _ = sut.view
        sut.viewDidLoad()
        XCTAssertTrue(sut.isViewLoaded)
    }

    public func test_setTeamElement_ShouldChangeTheViewControllerTitle() {
        let teamElement: TeamElement = TeamElement(team: "test", group: "test", flagIcon: "test")
        sut.setTeamElement(teamElement)
        _ = sut.view
        sut.viewDidLoad()
        XCTAssertEqual(sut.title, teamElement.team)
    }

}
