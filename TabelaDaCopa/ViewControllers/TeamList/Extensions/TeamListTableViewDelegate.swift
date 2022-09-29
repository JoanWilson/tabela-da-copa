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
        switch Groups.getSection(indexPath.section) {
        case .groupA:
            let teams = viewModel.getTeamsFromAGroup(group: Groups.groupA.rawValue)
            let teamName = teams[indexPath.row].team
            print(teamName)
        case .groupB:
            let teams = viewModel.getTeamsFromAGroup(group: Groups.groupB.rawValue)
            let teamName = teams[indexPath.row].team
            print(teamName)
        case .groupC:
            let teams = viewModel.getTeamsFromAGroup(group: Groups.groupC.rawValue)
            let teamName = teams[indexPath.row].team
            print(teamName)
        case .groupD:
            let teams = viewModel.getTeamsFromAGroup(group: Groups.groupD.rawValue)
            let teamName = teams[indexPath.row].team
            print(teamName)
        case .groupE:
            let teams = viewModel.getTeamsFromAGroup(group: Groups.groupE.rawValue)
            let teamName = teams[indexPath.row].team
            print(teamName)
        case .groupF:
            let teams = viewModel.getTeamsFromAGroup(group: Groups.groupF.rawValue)
            let teamName = teams[indexPath.row].team
            print(teamName)
        case .groupG:
            let teams = viewModel.getTeamsFromAGroup(group: Groups.groupG.rawValue)
            let teamName = teams[indexPath.row].team
            print(teamName)
        case .groupH:
            let teams = viewModel.getTeamsFromAGroup(group: Groups.groupH.rawValue)
            let teamName = teams[indexPath.row].team
            print(teamName)
        }
    }

}
