//
//  TabBarViewController.swift
//  TabelaDaCopa
//
//  Created by Joan Wilson Oliveira on 27/09/22.
//

import UIKit

final class TabBarViewController: UITabBarController {

    public var viewModel: TabBarViewModel = TabBarViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.buildLayout()

    }

}

extension TabBarViewController {

    public func setViewControllersToTabBar() {
        let teamsNavigationController = self.viewModel.createViewControllersForTabBar(
            for: TeamListViewController(),
            image: UIImage(systemName: "list.bullet.rectangle")!
            , title: "Teams"
        )

        let matchesNavigationController = self.viewModel.createViewControllersForTabBar(
            for: MatchesViewController(),
            image: UIImage(systemName: "sportscourt")!,
            title: "Matches"
        )

        let scoresNavigationController = self.viewModel.createViewControllersForTabBar(
            for: FavoritesViewController(),
            image: UIImage(systemName: "tablecells")!,
            title: "Scores"
        )

        let arrayOfNavigationControllers: [UINavigationController] = [
            teamsNavigationController,
            matchesNavigationController,
            scoresNavigationController
        ]

        viewModel.appendAnArrayToArrayTabBarNavigationControllers(arrayOfNavigationControllers)

        self.setViewControllers(viewModel.getArrayTabBarNavigationControllers(), animated: true)
    }

}
