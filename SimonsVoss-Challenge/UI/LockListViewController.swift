//
//  LockListViewController.swift
//  SimonsVoss-Challenge
//
//  Created by Pavel Palancica on 23.03.2023.
//

import UIKit

final class LockListViewController: UIViewController {

    private var locksDataService = LocksDataService()
    
    var lockItems: [Lock] = []
    
    private let locksTableView: UITableView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        configureConstraints()
    }
    
    init() {
        locksTableView = UITableView(frame: .zero, style: .plain)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        locksDataService.getAll { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
                case .success(let response):
                    strongSelf.lockItems = response.locks
                case .failure(let error):
                    print(error)
            }
        }
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
}
