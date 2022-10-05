//
//  TeamDetailViewController.swift
//  TabelaDaCopa
//
//  Created by Joan Wilson Oliveira on 29/09/22.
//

import UIKit

final class TeamDetailViewController: UIViewController {

    public lazy var tableViewTeamDetailList: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewTeamDetailCell")
        tableView.register(FlagTableViewCell.self, forCellReuseIdentifier: "TableViewTeamDetailFlagCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false

        return tableView
    }()

    private var teamElement: TeamElement = TeamElement(team: "nil", group: "nil", flagIcon: "nil")

    override func viewDidLoad() {
        super.viewDidLoad()
        buildLayout()
    }

    public func setTeamElement(_ teamElement: TeamElement) {
        self.teamElement = teamElement
    }

    public func getTeamElement() -> TeamElement {
        return self.teamElement
    }

}
