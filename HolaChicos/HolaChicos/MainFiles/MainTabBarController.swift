//
//  MainTabBarController.swift
//  HolaChicos
//
//  Created by Glauco Dantas Beserra on 12/07/22.
//  Copyright © 2022 My Organization. All rights reserved.
//

import UIKit

final class MainTabBarController: UITabBarController {
    override func loadView() {
        super.loadView()
        
        setUpTabBar()
        setUpViewControllers()
    }
    
    private func setUpTabBar() {
        view.tintColor = .darkGray
        tabBar.isTranslucent = false
        view.backgroundColor = .white
    }
    
    private func setUpViewControllers() {
        // intencionalmente n implementado
    }
}
