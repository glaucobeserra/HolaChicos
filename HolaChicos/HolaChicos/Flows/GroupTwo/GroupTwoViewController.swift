//
//  GroupTwoViewController.swift
//  HolaChicos
//
//  Created by Glauco Dantas Beserra on 13/07/22.
//  Copyright © 2022 My Organization. All rights reserved.
//

import UIKit

final class GroupTwoViewController: BaseViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
        
        tabBarItem.title = "Grupo ②"
        tabBarItem.image = UIImage(systemName: "network")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        view.backgroundColor = .red
    }
    
    override func loadView() {
        super.loadView()
        
        
    }
}
