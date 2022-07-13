//
//  MainCoordinator.swift
//  HolaChicos
//
//  Created by Glauco Dantas Beserra on 12/07/22.
//  Copyright © 2022 My Organization. All rights reserved.
//

import UIKit

final class MainCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    
    //
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        startTabBarController()
    }
    
    private func startTabBarController() {
        let viewController = MainTabBarController()
        viewController.viewControllers = [makeFirstTab(), makeSecondTab(), makeThirdTab()]
        
        navigationController.setViewControllers([viewController], animated: true)
    }
    
    private func makeFirstTab() -> UIViewController {
        let viewController = HomeViewController()
        
        viewController.coordinator = self
        viewController.tabBarItem.title = "Home"
        viewController.tabBarItem.image = UIImage(systemName: "house")

        return viewController
    }
    
    private func makeSecondTab() -> UIViewController {
        let viewController = GroupOneViewController()
        
        viewController.coordinator = self
        viewController.tabBarItem.title = "Grupo ⓵"
        viewController.tabBarItem.image = UIImage(systemName: "headphones")
        
        return viewController
    }
    
    private func makeThirdTab() -> UIViewController {
        let viewController = GroupTwoViewController()
        
        viewController.coordinator = self
        viewController.tabBarItem.title = "Grupo ②"
        viewController.tabBarItem.image = UIImage(systemName: "network")
        
        return viewController
    }
}
