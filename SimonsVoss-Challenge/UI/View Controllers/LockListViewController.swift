//
//  LockListViewController.swift
//  SimonsVoss-Challenge
//
//  Created by Pavel Palancica on 23.03.2023.
//

import UIKit

final class LockListViewController: UIViewController {
    
    internal let viewModel: LockListViewModelType
    
    private let locksTableView: UITableView
    
    private var searchController: UISearchController
    private var searchResultsVC: SearchResultsViewController
    
    init() {
        viewModel = LockListViewModel(service: LocksDataService(client: HTTPClient()))
        locksTableView = UITableView(frame: .zero, style: .plain)
        searchResultsVC = SearchResultsViewController()
        searchController = UISearchController(searchResultsController: searchResultsVC)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        configureConstraints()
        configureBindings()
        
        viewModel.createPresentation()
        
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Locks..."
        searchController.searchBar.autocapitalizationType = .none
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
//        definesPresentationContext = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

private extension LockListViewController {
    
    func setupUI() {
        view.backgroundColor = .white
        
        locksTableView.register(UINib(nibName: LockTableViewCell.identifier, bundle: nil),
                                forCellReuseIdentifier: LockTableViewCell.identifier)
        locksTableView.dataSource = self
        
        view.addSubview(locksTableView)
    }
    
    func configureConstraints() {
        locksTableView.translatesAutoresizingMaskIntoConstraints = false
        locksTableView.estimatedRowHeight = 132
        
        NSLayoutConstraint.activate([
            locksTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            locksTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            locksTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            locksTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
    
    private func configureBindings() {
        viewModel.title.bind { [weak self] title in
            guard let strongSelf = self else { return }
            strongSelf.navigationItem.title = title
        }
        
        viewModel.isLoading.bind { isLoading in
            print("isLoading = \(isLoading)")
        }
        
        viewModel.error.bind { error in
            if let error = error {
                print(error)
            }
        }
        
        viewModel.cellViewModels.bind { [weak self] viewModels in
            guard let strongSelf = self else { return }
            strongSelf.locksTableView.reloadData()
        }
    }
}
