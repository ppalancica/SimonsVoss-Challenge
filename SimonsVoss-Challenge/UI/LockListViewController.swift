//
//  LockListViewController.swift
//  SimonsVoss-Challenge
//
//  Created by Pavel Palancica on 23.03.2023.
//

import UIKit

final class LockListViewController: UIViewController {

    internal let lockItems: [Lock] = [
        Lock(id: UUID(),
             buildingId: UUID(),
             type: "Cylinder",
             name: "Gästezimmer 4.OG",
             description: "null",
             serialNumber: "UID-A89F98F3",
             floor: "4.OG",
             roomNumber: "454")
    ]
    
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
