//
//  TeamListTableViewDelegate.swift
//  TabelaDaCopa
//
//  Created by Joan Wilson Oliveira on 29/09/22.
//

import Foundation
import UIKit

extension TeamListViewController: UITableViewDelegate {

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let teams = self.viewModel.sectionsOfGroups[indexPath.section]
        let teamDetailViewController = TeamDetailViewController()
        let teamSelected = TeamElement(
            team: teams.teams[indexPath.row],
            group: teams.group,
            flagIcon: teams.teamsFlags[indexPath.row]
        )
        teamDetailViewController.setTeamElement(teamSelected)
        self.navigationController?.pushViewController(teamDetailViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
