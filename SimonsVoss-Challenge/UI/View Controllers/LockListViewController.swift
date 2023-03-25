//
//  LockListViewController.swift
//  SimonsVoss-Challenge
//
//  Created by Pavel Palancica on 23.03.2023.
//

import UIKit

final class LockListViewController: UIViewController {
    
    internal let viewModel: LockListViewModel
    
    private let locksTableView: UITableView
    
    init() {
        viewModel = LockListViewModel(service: LocksDataService(client: HTTPClient()))
        locksTableView = UITableView(frame: .zero, style: .plain)
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
        
        viewModel.loadAll()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

private extension LockListViewController {
    
    func setupUI() {
        navigationItem.title = "Locks"
        view.backgroundColor = .white
        
        locksTableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableView.self))
        locksTableView.dataSource = self
        
        view.addSubview(locksTableView)
    }
    
    func configureConstraints() {
        locksTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            locksTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            locksTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            locksTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            locksTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
    
    private func configureBindings() {
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
