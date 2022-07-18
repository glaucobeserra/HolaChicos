//
//  UIView+Extensions.swift
//  HolaChicos
//
//  Created by Glauco Dantas Beserra on 16/07/22.
//  Copyright © 2022 My Organization. All rights reserved.
//

import UIKit

extension UIView {
    
    func anchor(to superView: UIView, constant: CGFloat = .zero) {
        anchorWithCustomConstant(to: superView,
                                 top: constant,
                                 bottom: -constant,
                                 leading: constant,
                                 trailing: -constant)
    }
    
    func anchorWithCustomConstant(to superView: UIView,
                top: CGFloat = 8,
                bottom: CGFloat = -8,
                leading: CGFloat = 8,
                trailing: CGFloat = -8) {
        superView.addSubview(self)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: superView.topAnchor, constant: top),
            self.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: bottom),
            self.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: leading),
            self.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: trailing)
        ])
    }
    
    func centralizeXAndYAnchors(to superView: UIView) {
        superView.addSubview(self)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.centerXAnchor.constraint(equalTo: superView.centerXAnchor),
            self.centerYAnchor.constraint(equalTo: superView.centerYAnchor)
        ])
    }
}
