//
//  ChicoDetailViewController.swift
//  HolaChicos
//
//  Created by Glauco Dantas Beserra on 17/07/22.
//  Copyright © 2022 My Organization. All rights reserved.
//

import Foundation

final class ChicoDetailViewController: BaseViewController {
    
    // MARK: - Properties
    private let viewModel: ChicoDetailViewModel
    
    // MARK: - Initialization
    init(viewModel: ChicoDetailViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .gray
        
        print("💫 ", viewModel.chico.name)
        print("💫 ", viewModel.chico.imageName)
        print("💫 ", viewModel.chico.description)
        print("💫 ", viewModel.chico.backgroundColor ?? "👎 empty")
    }
}
