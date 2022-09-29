//
//  TeamListTableViewDatasource.swift
//  TabelaDaCopa
//
//  Created by Joan Wilson Oliveira on 29/09/22.
//

import Foundation
import UIKit

extension TeamListViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        let numberOfRowsInSection = self.viewModel.teamList.count
        return numberOfRowsInSection
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "TableViewTeamListCell",
            for: indexPath
        )
        let teamName = viewModel.teamList[indexPath.row].team
        let teamFlag = viewModel.teamList[indexPath.row].flagIcon
        cell.textLabel?.text = "\(teamFlag) \(teamName)"

        return cell
    }
}
