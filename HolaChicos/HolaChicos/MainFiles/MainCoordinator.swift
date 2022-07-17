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
        viewController.viewControllers = [makeFirstTab(), makeSecondTab(), makeThirdTab(), makeFourthTab(), makeFifthTab()]
        
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.setViewControllers([viewController], animated: true)
    }
    
    private func makeFirstTab() -> UIViewController {
        let navigationController = UINavigationController()
        
        let homeFlowCoordinator = HomeFlowCoordinator(navigationController: navigationController)
        homeFlowCoordinator.parentCoordinator = self
        homeFlowCoordinator.start()
        
        childCoordinators.append(homeFlowCoordinator)
        
        return navigationController
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
    
    private func makeFourthTab() -> UIViewController {
        let viewController = OverlapViewController()
        
        viewController.coordinator = self
        viewController.tabBarItem.title = "Overlap"
        viewController.tabBarItem.image = UIImage(systemName: "tray.2.fill")
        
        return viewController
    }
    
    private func makeFifthTab() -> UIViewController {
        let viewController = MoreOptionsViewController()
        
        viewController.coordinator = self
        viewController.tabBarItem.title = "Mais"
        viewController.tabBarItem.image = UIImage(systemName: "ellipsis.circle")
        
        return viewController
    }
}
