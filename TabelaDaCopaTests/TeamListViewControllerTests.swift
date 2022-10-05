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
        let arrayOfGroups: [String] = ["A", "B", "C", "D", "E", "F", "G", "H"]
        var numberOfRowsInSection: Int!
        for index in 0..<8 {
            numberOfRowsInSection = TeamListViewModel().getNumberOfTeamsInAGroup(for: arrayOfGroups[index])
            _ = sut.view
            sut.viewDidLoad()
            let result = sut.tableViewTeamList.dataSource?.tableView(
                sut.tableViewTeamList,
                numberOfRowsInSection: numberOfRowsInSection
            )
            XCTAssertEqual(result, 4)
        }
    }

    public func test_TeamListTableViewNumberOfSection_ShouldReturn8() {
        _ = sut.view
        sut.viewDidLoad()
        let result = sut.numberOfSections(in: sut.tableViewTeamList)
        XCTAssertEqual(result, 8)
    }

    public func test_didSelectRowAt_MustRedirectToSelectedView() {
        _ = sut.view
        sut.viewDidLoad()
        var indexPathSelected = IndexPath(row: 0, section: 0)

        for indexI in 0..<8 {
            indexPathSelected = IndexPath(row: 0, section: indexI)
            sut.tableViewTeamList.delegate?.tableView?(sut.tableViewTeamList, didSelectRowAt: indexPathSelected)
            let result: Void = sut.tableViewTeamList.selectRow(
                at: indexPathSelected,
                animated: true, scrollPosition: .top
            )
            XCTAssertNotNil(result)
        }
    }

}
