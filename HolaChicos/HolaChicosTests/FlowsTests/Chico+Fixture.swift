//
//  Chico+Fixture.swift
//  HolaChicosTests
//
//  Created by Glauco Dantas Beserra on 17/07/22.
//  Copyright © 2022 My Organization. All rights reserved.
//

import UIKit

@testable import HolaChicos

extension Chico {
    
    
    static func fixture(name: String = "Chico Name",
                        description: String = "Description of Chico",
                        imageName: String = String(),
                        backgroundColor: UIColor? = nil) -> Chico {
        
        return Chico(name: name, description: description, imageName: imageName, backgroundColor: backgroundColor)
    }
    
    static func fixtureList(_ chicos: [Chico]? = nil) -> [Chico] {
        guard let chicos = chicos else {
            var fixtureChicos: [Chico] = []
            
            for i in 1...10 {
                fixtureChicos.append(Chico(name: "Chico Name #\(i)",
                                           description: "Description of Chico #\(i)",
                                           imageName: "chicoIcon",
                                           backgroundColor: UIColor.random))
            }
            
            return fixtureChicos
        }

        return chicos
    }
}
