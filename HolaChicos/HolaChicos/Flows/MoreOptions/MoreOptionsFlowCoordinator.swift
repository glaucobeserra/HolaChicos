//
//  MoreOptionsFlowCoordinator.swift
//  HolaChicos
//
//  Created by Glauco Dantas Beserra on 18/07/22.
//  Copyright © 2022 My Organization. All rights reserved.
//

import UIKit

enum MoreOptionsFlow {
    case root
    case detail
}

final class MoreOptionsFlowCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        goTo(.root)
    }
    
    func goTo(_ route: MoreOptionsFlow) {
        switch route {
        case .root: goToMoreOptionsViewController()
        case .detail: goToMoreOptionsDetailViewController()
        }
    }
    
    private func goToMoreOptionsViewController() {
        let viewModel = MoreOptionsViewModel()
        let viewController = MoreOptionsViewController(viewModel: viewModel)
        
        
        viewController.coordinator = self
        viewController.tabBarItem.title = "Mais"
        viewController.navigationItem.title = "➕ Opções"
        viewController.tabBarItem.image = UIImage(systemName: "ellipsis.circle")
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func goToMoreOptionsDetailViewController() {
        let viewController = MoreOptionsDetailViewController()
        viewController.coordinator = self
        navigationController.tabBarController?.tabBar.isHidden = true
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    
}
