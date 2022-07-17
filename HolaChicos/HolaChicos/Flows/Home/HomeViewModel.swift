//
//  HomeViewModel.swift
//  HolaChicos
//
//  Created by Glauco Dantas Beserra on 16/07/22.
//  Copyright © 2022 My Organization. All rights reserved.
//

import Foundation
import UIKit

protocol HomeViewModelDelegate: AnyObject {
    func didFetch(data: [Chico])
}

final class HomeViewModel {
    
    // MARK: - Properties
    
    var chicos: [Chico] = []
    var isLoading: ((Bool) -> Void)?
    
    private let service: ServiceAPIProtocol
    
    weak var delegate: HomeViewModelDelegate?
    
    // MARK: - Initialization
    init(service: ServiceAPIProtocol) {
        self.service = service
    }
    
    // MARK: - Public methods
    func fetchChicos() {
        isLoading?(true)
        
        service.fetchChicos { [weak self] response in
            guard let self = self else { return }
            self.isLoading?(false)
            
            guard let chicos = response, !chicos.isEmpty else { return }
            
            self.chicos = chicos
            self.delegate?.didFetch(data: chicos)
        }
    }
    
    func getChico(at indexPath: IndexPath) -> Chico {
        return chicos[indexPath.row]
    }
    
}
