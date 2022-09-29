//
//  TeamListViewControllerTests.swift
//  TabelaDaCopaTests
//
//  Created by Joan Wilson Oliveira on 28/09/22.
//

import XCTest
@testable import TabelaDaCopa

public final class TeamListViewControllerTests: XCTestCase {

    private var sut: TeamListViewController!

    public override func setUpWithError() throws {
        sut = TeamListViewController()
    }

    public override func tearDownWithError() throws {
        sut = nil
    }

    public func test_viewDidLoad_MustCallBuildLayoutFromViewCodingProtocol() {
        _ = sut.view
        sut.viewDidLoad()
        XCTAssertTrue(sut.isViewLoaded)
        XCTAssertNotNil(sut as ViewCoding)
    }

    public func test_viewDidLoad_RendersTheViewTitle() {
        _ = sut.view
        XCTAssertEqual(sut.title, "Teams")
    }

    public func test_TeamListViewController_ShouldHaveTableViewTeamListAsSubview() {
        _ = sut.view
        sut.viewDidLoad()
        XCTAssertNotNil(sut.tableViewTeamList.self as UITableView)
    }

    public func test_TeamListTableViewNumberOfRowsInSection_ShouldReturn32() {
        let numberOfRowsInSection = TeamListViewModel().teamList.count
        _ = sut.view
        sut.viewDidLoad()
        let result = sut.tableViewTeamList.dataSource?.tableView(
            sut.tableViewTeamList,
            numberOfRowsInSection: numberOfRowsInSection
        )
        XCTAssertEqual(result, 32)
    }

}
