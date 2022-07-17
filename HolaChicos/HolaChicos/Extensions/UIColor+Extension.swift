//
//  UIColor+Extension.swift
//  HolaChicos
//
//  Created by Glauco Dantas Beserra on 16/07/22.
//  Copyright © 2022 My Organization. All rights reserved.
//

import UIKit

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}
