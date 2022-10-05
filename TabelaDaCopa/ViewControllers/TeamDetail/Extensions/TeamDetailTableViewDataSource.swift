//
//  TeamDetailViewDataSource.swift
//  TabelaDaCopa
//
//  Created by Joan Wilson Oliveira on 01/10/22.
//

import Foundation
import UIKit

public enum TeamDetails: String, CaseIterable {
    case flagImage = "Flag"
    case matches = "Matches"
    case players = "Players"

    static func numberOfSections() -> Int {
        return self.allCases.count
    }

    static func getSection(_ section: Int) -> TeamDetails {
        return self.allCases[section]
    }

    static func getSectionName(_ section: Int) -> String {
        let groupName: String = "\(self.allCases[section].rawValue)"
        return groupName
    }
}

struct TeamDetailSection {
    let name: String
    let rows: [String]
}

extension TeamDetailViewController: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch TeamDetails.getSection(section) {
        case .flagImage:
            return ""
        case .matches:
            return TeamDetails.getSectionName(section)
        case .players:
            return TeamDetails.getSectionName(section)
        }
    }

    public func numberOfSections(in tableView: UITableView) -> Int {
        return TeamDetails.numberOfSections()
    }

    public func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        switch TeamDetails.getSection(section) {
        case .flagImage:
            return 1
        case .matches:
            return 3
        case .players:
            return 11
        }

    }

    public func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewTeamDetailCell",
                                                 for: indexPath)

        switch TeamDetails.getSection(indexPath.section) {
        case .flagImage:

            guard let newCell = tableView.dequeueReusableCell(withIdentifier: "TableViewTeamDetailFlagCell",
                                                              for: indexPath) as? FlagTableViewCell else {
                return UITableViewCell()
            }

            let getFlagName = self.getTeamElement().team.lowercased()
            newCell.flagImage.image = UIImage(named: getFlagName)
            newCell.layoutIfNeeded()
            return newCell
        case .matches:
            cell.textLabel?.text = "Nenhuma ainda"
        case .players:
            cell.textLabel?.text = "Ronaldo"
        }

        return cell
    }

    func setUpImage(for cell: FlagTableViewCell, with image: UIImage) {
        DispatchQueue.main.async {
            cell.flagImage.image = image
            NSLayoutConstraint.activate([
                cell.flagImage.topAnchor.constraint(equalTo: cell.topAnchor),
                cell.flagImage.bottomAnchor.constraint(equalTo: cell.bottomAnchor),
                cell.flagImage.leadingAnchor.constraint(equalTo: cell.leadingAnchor),
                cell.flagImage.trailingAnchor.constraint(equalTo: cell.trailingAnchor)
            ])
        }
    }

}
