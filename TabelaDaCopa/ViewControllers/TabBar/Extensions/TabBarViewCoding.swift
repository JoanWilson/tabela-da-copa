//
//  TabBarViewControllerViewCoding.swift
//  TabelaDaCopa
//
//  Created by Joan Wilson Oliveira on 04/10/22.
//

import Foundation
import UIKit

extension TabBarViewController: ViewCoding {

    func setupView() {
        self.setViewControllersToTabBar()
        self.view.tintColor = UIColor(named: "darkRed")
    }

    func setupHierarchy() {

    }

    func setupConstraints() {

    }

}
