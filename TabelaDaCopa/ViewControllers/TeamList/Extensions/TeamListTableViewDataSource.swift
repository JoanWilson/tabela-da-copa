//
//  TeamListTableViewDatasource.swift
//  TabelaDaCopa
//
//  Created by Joan Wilson Oliveira on 29/09/22.
// 

import Foundation
import UIKit

extension TeamListViewController: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Group " + self.viewModel.sectionsOfGroups[section].group
    }

    public func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.sectionsOfGroups.count
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.sectionsOfGroups[section].teams.count
    }

    public func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewTeamListCell",
                                                 for: indexPath)
        let teams = self.viewModel.sectionsOfGroups[indexPath.section]
        let teamName = teams.teams[indexPath.row]
        let teamFlag = teams.teamsFlags[indexPath.row]
        cell.textLabel?.text = "\(teamFlag) \(teamName)"

        return cell
    }

}
