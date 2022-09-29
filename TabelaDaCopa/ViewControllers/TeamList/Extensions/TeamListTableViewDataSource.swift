//
//  TeamListTableViewDatasource.swift
//  TabelaDaCopa
//
//  Created by Joan Wilson Oliveira on 29/09/22.
// swiftlint:disable function_body_length

import Foundation
import UIKit

public enum Groups: String, CaseIterable {
    case groupA = "A"
    case groupB = "B"
    case groupC = "C"
    case groupD = "D"
    case groupE = "E"
    case groupF = "F"
    case groupG = "G"
    case groupH = "H"

    static func numberOfSections() -> Int {
        return self.allCases.count
    }

    static func getSection(_ section: Int) -> Groups {
        return self.allCases[section]
    }

    static func getSectionName(_ section: Int) -> String {
        let groupName: String = "Group \(self.allCases[section].rawValue)"
        return groupName
    }
}

struct Section {
    let group: String
    let teams: [String]
}

extension TeamListViewController: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch Groups.getSection(section) {
        case .groupA:
            return Groups.getSectionName(section)
        case .groupB:
            return Groups.getSectionName(section)
        case .groupC:
            return Groups.getSectionName(section)
        case .groupD:
            return Groups.getSectionName(section)
        case .groupE:
            return Groups.getSectionName(section)
        case .groupF:
            return Groups.getSectionName(section)
        case .groupG:
            return Groups.getSectionName(section)
        case .groupH:
            return Groups.getSectionName(section)
        }
    }

    public func numberOfSections(in tableView: UITableView) -> Int {
        return Groups.numberOfSections()
    }

    public func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        switch Groups.getSection(section) {
        case .groupA:
            return self.viewModel.getNumberOfTeamsInAGroup(for: Groups.getSection(section).rawValue)
        case .groupB:
            return self.viewModel.getNumberOfTeamsInAGroup(for: Groups.getSection(section).rawValue)
        case .groupC:
            return self.viewModel.getNumberOfTeamsInAGroup(for: Groups.getSection(section).rawValue)
        case .groupD:
            return self.viewModel.getNumberOfTeamsInAGroup(for: Groups.getSection(section).rawValue)
        case .groupE:
            return self.viewModel.getNumberOfTeamsInAGroup(for: Groups.getSection(section).rawValue)
        case .groupF:
            return self.viewModel.getNumberOfTeamsInAGroup(for: Groups.getSection(section).rawValue)
        case .groupG:
            return self.viewModel.getNumberOfTeamsInAGroup(for: Groups.getSection(section).rawValue)
        case .groupH:
            return self.viewModel.getNumberOfTeamsInAGroup(for: Groups.getSection(section).rawValue)
        }

    }

    public func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "TableViewTeamListCell",
            for: indexPath
        )

        switch Groups.getSection(indexPath.section) {

        case .groupA:
            let teams = viewModel.getTeamsFromAGroup(group: Groups.groupA.rawValue)
            let teamName = teams[indexPath.row].team
            let teamFlag = teams[indexPath.row].flagIcon
            cell.textLabel?.text = "\(teamFlag) \(teamName)"
        case .groupB:
            let teams = viewModel.getTeamsFromAGroup(group: Groups.groupB.rawValue)
            let teamName = teams[indexPath.row].team
            let teamFlag = teams[indexPath.row].flagIcon
            cell.textLabel?.text = "\(teamFlag) \(teamName)"
        case .groupC:
            let teams = viewModel.getTeamsFromAGroup(group: Groups.groupC.rawValue)
            let teamName = teams[indexPath.row].team
            let teamFlag = teams[indexPath.row].flagIcon
            cell.textLabel?.text = "\(teamFlag) \(teamName)"
        case .groupD:
            let teams = viewModel.getTeamsFromAGroup(group: Groups.groupD.rawValue)
            let teamName = teams[indexPath.row].team
            let teamFlag = teams[indexPath.row].flagIcon
            cell.textLabel?.text = "\(teamFlag) \(teamName)"
        case .groupE:
            let teams = viewModel.getTeamsFromAGroup(group: Groups.groupE.rawValue)
            let teamName = teams[indexPath.row].team
            let teamFlag = teams[indexPath.row].flagIcon
            cell.textLabel?.text = "\(teamFlag) \(teamName)"
        case .groupF:
            let teams = viewModel.getTeamsFromAGroup(group: Groups.groupF.rawValue)
            let teamName = teams[indexPath.row].team
            let teamFlag = teams[indexPath.row].flagIcon
            cell.textLabel?.text = "\(teamFlag) \(teamName)"
        case .groupG:
            let teams = viewModel.getTeamsFromAGroup(group: Groups.groupG.rawValue)
            let teamName = teams[indexPath.row].team
            let teamFlag = teams[indexPath.row].flagIcon
            cell.textLabel?.text = "\(teamFlag) \(teamName)"
        case .groupH:
            let teams = viewModel.getTeamsFromAGroup(group: Groups.groupH.rawValue)
            let teamName = teams[indexPath.row].team
            let teamFlag = teams[indexPath.row].flagIcon
            cell.textLabel?.text = "\(teamFlag) \(teamName)"
        }

        return cell
    }

}
