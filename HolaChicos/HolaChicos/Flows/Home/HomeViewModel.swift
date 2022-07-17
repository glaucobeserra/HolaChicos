//
//  HomeViewModel.swift
//  HolaChicos
//
//  Created by Glauco Dantas Beserra on 16/07/22.
//  Copyright © 2022 My Organization. All rights reserved.
//

import Foundation
import UIKit

final class HomeViewModel {
    
    // MARK: - Properties
    var chicos: [Chico] = []
    var isLoading: ((Bool) -> Void)?
    
    private let service: ServiceAPI
    
    
    // MARK: - Initialization
    init(service: ServiceAPI) {
        self.service = service
    }
    
    // MARK: - Public methods
    func fetchChicos(_ completion: @escaping (([Chico]?) -> Void)) {
        isLoading?(true)
        var dummyResponse: [Chico] = []
        
        for i in 1...15 {
            dummyResponse.append(Chico(name: "Chico \(i)", description: "Description of Chico #\(i)", backgroundColor: UIColor.random))
        }
        
        // Simulando o tempo de resposta da API
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            self.isLoading?(false)
            self.chicos = dummyResponse
            
            completion(dummyResponse)
        })
    }
    
    func getChico(at indexPath: IndexPath) -> Chico {
        return chicos[indexPath.row]
    }
    
}
