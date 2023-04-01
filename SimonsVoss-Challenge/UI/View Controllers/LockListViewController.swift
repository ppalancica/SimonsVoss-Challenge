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
    internal let searchController: UISearchController
    private let searchResultsVC: SearchResultsViewController
    
    private let activityIndicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.style = .large
        return view
    }()
    
    init(viewModel: LockListViewModelType) {
        self.viewModel = viewModel
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @objc func refresh() {
        viewModel.createPresentation()
    }
}

private extension LockListViewController {
    
    func setupUI() {
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(barButtonSystemItem: .refresh,
                            target: self,
                            action: #selector(refresh))
        
        locksTableView.register(UINib(nibName: LockTableViewCell.identifier, bundle: nil),
                                forCellReuseIdentifier: LockTableViewCell.identifier)
        locksTableView.dataSource = self
        view.addSubview(locksTableView)
        locksTableView.addSubview(activityIndicatorView)
        
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Locks..."
        searchController.searchBar.autocapitalizationType = .none
        searchController.searchBar.delegate = self
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
    }
    
    func configureConstraints() {
        locksTableView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        locksTableView.estimatedRowHeight = 132
        
        NSLayoutConstraint.activate([
            locksTableView.topAnchor.constraint(equalTo: view.topAnchor),
            locksTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            locksTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            locksTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            activityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func configureBindings() {
        viewModel.title.bind { [weak self] title in
            guard let strongSelf = self else { return }
            strongSelf.navigationItem.title = title
        }
        
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let strongSelf = self else { return }
            if isLoading {
                strongSelf.activityIndicatorView.startAnimating()
            } else {
                strongSelf.activityIndicatorView.stopAnimating()
            }
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
