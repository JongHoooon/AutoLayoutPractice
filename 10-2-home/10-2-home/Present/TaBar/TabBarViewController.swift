//
//  TabBarViewController.swift
//  10-2-home
//
//  Created by JongHoon on 2022/10/14.
//

import UIKit

final class TabBarViewController: UITabBarController {

// MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTabBar()
    }
}

// MARK: - Private

private extension TabBarViewController {
    
    func configureTabBar() {
        let tabBarViewControllers: [UIViewController] =
        TabBarItem.allCases.map { tabCase in
            let viewController = tabCase.viewController
            viewController.tabBarItem = UITabBarItem(
                title: tabCase.title,
                image: tabCase.icon.default,
                selectedImage: tabCase.icon.selected
            )
            return viewController
        }
        viewControllers = tabBarViewControllers
    }
}


