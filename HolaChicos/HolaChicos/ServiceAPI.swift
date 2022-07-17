//
//  ServiceAPI.swift
//  HolaChicos
//
//  Created by Glauco Dantas Beserra on 16/07/22.
//  Copyright © 2022 My Organization. All rights reserved.
//

import UIKit

protocol ServiceAPIProtocol {
    func fetchChicos(_ completion: @escaping ([Chico]?) -> Void)
}

final class ServiceAPI: ServiceAPIProtocol {
    func fetchChicos(_ completion: @escaping ([Chico]?) -> Void) {
        var dummyResponse = [Chico]()
        
        for i in 1...15 {
            dummyResponse.append(Chico(name: "Chico \(i)", description: "Description of Chico #\(i)", backgroundColor: UIColor.random))
        }
        
        // Simulando o tempo de resposta da API
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            completion(dummyResponse)
        })
    }
}
