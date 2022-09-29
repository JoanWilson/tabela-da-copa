//
//  TeamListViewCoding.swift
//  TabelaDaCopa
//
//  Created by Joan Wilson Oliveira on 29/09/22.
//

import Foundation
import UIKit

extension TeamListViewController: ViewCoding {
    func setupView() {
        self.title = "Teams"
        self.tableViewTeamList.dataSource = self
        self.tableViewTeamList.delegate = self
    }

    func setupConstraints() {
        self.tableViewTeamList.pin(to: self.view)
    }

    func setupHierarchy() {
        self.view.addSubview(self.tableViewTeamList)
    }
}
