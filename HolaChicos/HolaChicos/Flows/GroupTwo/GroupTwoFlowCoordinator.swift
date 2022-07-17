//
//  GroupTwoFlowCoordinator.swift
//  HolaChicos
//
//  Created by Glauco Dantas Beserra on 14/07/22.
//  Copyright © 2022 My Organization. All rights reserved.
//

import UIKit

final class GroupTwoFlowCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        goToGroupTwoViewController()
    }
    
    private func goToGroupTwoViewController() {
        //
    }
}
