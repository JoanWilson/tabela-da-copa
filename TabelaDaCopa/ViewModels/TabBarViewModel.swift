//
//  TabBarViewModel.swift
//  TabelaDaCopa
//
//  Created by Joan Wilson Oliveira on 04/10/22.
//

import Foundation
import UIKit

public final class TabBarViewModel {

    private var arrayTabBarNavigationControllers: [UINavigationController] = []

    init() {}

    public func createViewControllersForTabBar(for viewController: UIViewController,
                                               image: UIImage,
                                               title: String) -> UINavigationController {
        let createdViewController = UINavigationController(rootViewController: viewController)
        createdViewController.tabBarItem.image = image
        createdViewController.title = title

        return createdViewController
    }

    public func getArrayTabBarNavigationControllers() -> [UINavigationController] {
        return self.arrayTabBarNavigationControllers
    }

    public func setArrayTabBarNavigationControllers(_ navigationControllers: [UINavigationController]) {
        self.arrayTabBarNavigationControllers = navigationControllers
    }

    public func appendToArrayTabBarNavigationControllers(_ navigationController: UINavigationController) {
        self.arrayTabBarNavigationControllers.append(navigationController)
    }

    public func appendAnArrayToArrayTabBarNavigationControllers(_ navigationControllers: [UINavigationController]) {
        for index in navigationControllers {
            self.appendToArrayTabBarNavigationControllers(index)
        }
    }

}
