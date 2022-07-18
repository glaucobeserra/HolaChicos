//
//  MoreOptionsViewController.swift
//  HolaChicos
//
//  Created by Glauco Dantas Beserra on 14/07/22.
//  Copyright © 2022 My Organization. All rights reserved.
//

import UIKit

final class MoreOptionsViewController: BaseViewController {
    
    // MARK: - Computed Properties
    private let viewModel: MoreOptionsViewModel
    
    // MARK: - Initialization
    init(viewModel: MoreOptionsViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: - Life cycle
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .orange
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let coordinator = coordinator as? MoreOptionsFlowCoordinator else { return }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            coordinator.goTo(.detail)
        })
    }
}
