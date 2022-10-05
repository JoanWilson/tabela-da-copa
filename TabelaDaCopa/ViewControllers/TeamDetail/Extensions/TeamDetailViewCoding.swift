//
//  TeamDetailViewCoding.swift
//  TabelaDaCopa
//
//  Created by Joan Wilson Oliveira on 29/09/22.
//

import Foundation
import UIKit

extension TeamDetailViewController: ViewCoding {
    func setupView() {
        self.view.backgroundColor = .white
        self.title = self.getTeamElement().team
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.tableViewTeamDetailList.dataSource = self
        self.tableViewTeamDetailList.delegate = self
    }

    func setupHierarchy() {
        self.view.addSubview(self.tableViewTeamDetailList)
    }

    func setupConstraints() {
        self.tableViewTeamDetailList.pin(to: self.view)
    }
}
