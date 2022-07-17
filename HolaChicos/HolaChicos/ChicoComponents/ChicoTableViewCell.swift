//
//  ChicoTableViewCell.swift
//  HolaChicos
//
//  Created by Glauco Dantas Beserra on 16/07/22.
//  Copyright © 2022 My Organization. All rights reserved.
//

import UIKit

class ChicoTableViewCell: UITableViewCell {
    
    // MARK: - Stored Properties
    lazy var iconImageView: UIImageView = {
        let image = UIImage(named: "")
        let imageView = UIImageView(image: image)
        imageView.frame.size = CGSize(width: 48, height: 48)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var iconView: UIView = {
        let view = UIView()
//        view.frame.size = CGSize(width: 48, height: 48) // PQ ????
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalToConstant: 48),
            view.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [iconView, infoStackView])
        
        stackView.spacing = 8
        stackView.alignment = .top
        stackView.distribution = .fillProportionally
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    lazy var infoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, descriptionLabel])

        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    // MARK: - Initialization
    func setUp(with chico: Chico) {
        setUpContentView()
        fillComponents(with: chico)
    }
    
    // MARK: - Private methods
    private func fillComponents(with chico: Chico) {
        nameLabel.text = chico.name
        descriptionLabel.text = chico.description
        iconView.backgroundColor = chico.backgroundColor
    }
    
    private func setUpContentView() {
        contentStackView.anchor(to: contentView, constant: 8)
    }

}
