//
//  HomeFlowCoordinator.swift
//  HolaChicos
//
//  Created by Glauco Dantas Beserra on 14/07/22.
//  Copyright © 2022 My Organization. All rights reserved.
//

import UIKit

enum HomeFlow {
    case home
    case detail(_ chico: Chico)
}

final class HomeFlowCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        goTo(.home)
    }
    
    func goTo(_ route: HomeFlow) {
        switch route {
        case .home: goToHomeViewController()
        case .detail(let chico): goToChicoDetailViewController(with: chico)
        }
    }
    
    private func goToHomeViewController() {
        let viewModel = HomeViewModel(service: ServiceAPI())
        let viewController = HomeViewController(viewModel: viewModel)
        
        setUpHomeViewController(viewController)
        
        navigationController.setViewControllers([viewController], animated: true)
    }
    
    private func setUpHomeViewController(_ viewController: BaseViewController) {
        viewController.coordinator = self
        viewController.tabBarItem.title = "Home"
        viewController.tabBarItem.image = UIImage(systemName: "house")
    }
    
    private func goToChicoDetailViewController(with chico: Chico) {
        let viewModel = ChicoDetailViewModel(chico)
        let viewController = ChicoDetailViewController(viewModel: viewModel)
        
        navigationController.pushViewController(viewController, animated: true)
    }
}
