//
//  TeamListViewController.swift
//  TabelaDaCopa
//
//  Created by Joan Wilson Oliveira on 27/09/22.
//

import UIKit

final class TeamListViewController: UIViewController {

    public var viewModel: TeamListViewModel = TeamListViewModel()
    public var matches: [Match]?

    public lazy var tableViewTeamList: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: "TableViewTeamListCell"
        )
        tableView.translatesAutoresizingMaskIntoConstraints = false

        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        buildLayout()

        MatchesClient().fetchMatches { [weak self] (matches) in
            self?.matches = matches
            DispatchQueue.main.async {
                print(matches)
            }
        }
    }

}
