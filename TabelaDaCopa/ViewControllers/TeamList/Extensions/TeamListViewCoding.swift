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
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor(named: "darkRed") ?? .red]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "darkRed") ?? .red]

        self.navigationItem.standardAppearance = appearance
        self.navigationItem.scrollEdgeAppearance = appearance
    }

    func setupHierarchy() {
        self.view.addSubview(self.tableViewTeamList)
    }

    func setupConstraints() {
        self.tableViewTeamList.pin(to: self.view)
    }

}
