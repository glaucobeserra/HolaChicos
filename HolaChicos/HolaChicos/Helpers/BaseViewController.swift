//
//  BaseViewController.swift
//  HolaChicos
//
//  Created by Glauco Dantas Beserra on 12/07/22.
//  Copyright © 2022 My Organization. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    weak var coordinator: Coordinator?
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        
        activityIndicator.color = .red
        activityIndicator.hidesWhenStopped = true
        activityIndicator.centralizeXAndYAnchors(to: view)
        
        view.bringSubviewToFront(activityIndicator)
        
        return activityIndicator
    }()

    func activityIndicator(_ isEnabled: Bool) {
        isEnabled ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
    }
    
    override func loadView() {
        super.loadView()
    }
    
}
