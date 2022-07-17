//
//  HomeViewController.swift
//  HolaChicos
//
//  Created by Glauco Dantas Beserra on 13/07/22.
//  Copyright © 2022 My Organization. All rights reserved.
//

import UIKit

final class HomeViewController: BaseViewController {
    
    // MARK: - Computed Properties
    private let viewModel: HomeViewModel
    
    // MARK: - Stored Properties
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.register(ChicoTableViewCell.self, forCellReuseIdentifier: ChicoTableViewCell.identifier)
        
        return tableView
    }()
    
    // MARK: - Initialization
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: - Life cycle
    override func loadView() {
        super.loadView()
        
        setUpView()
        setUpSubviews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        viewModel.fetchChicos()
    }
    
    // MARK: - Private methods
    private func setUpView() {
        navigationItem.title = "🏠 Home"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setUpSubviews() {
        setUpTableView()
        
        viewModel.isLoading = { [weak self] isLoading in
            guard let self = self else { return }
            self.activityIndicator(isLoading)
        }
    }
    
    private func setUpTableView() {
        tableView.anchor(to: view)
    }
    
    // MARK: - Actions
}

// MARK: - UITableViewDataSource Extension
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChicoTableViewCell.identifier) as? ChicoTableViewCell else { return UITableViewCell() }
        
        cell.setUp(with: viewModel.getChico(at: indexPath))
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.chicos.count
    }
}

// MARK: - UITableViewDelegate Extension
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let homeCoordinator = coordinator as? HomeFlowCoordinator else { return }
        
        let selectedChico = viewModel.getChico(at: indexPath)
        homeCoordinator.goTo(.detail(selectedChico))
        
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

extension HomeViewController: HomeViewModelDelegate {
    func didFetch(data: [Chico]) {
        tableView.reloadData()
    }
}
