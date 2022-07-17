//
//  UITableViewCell+Extensions.swift
//  HolaChicos
//
//  Created by Glauco Dantas Beserra on 16/07/22.
//  Copyright © 2022 My Organization. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    static var identifier: String { return String(describing: self) }

//    static func identifier() -> String {
//        return String(describing: self).components(separatedBy: ".").last ?? String()
//    }
}
