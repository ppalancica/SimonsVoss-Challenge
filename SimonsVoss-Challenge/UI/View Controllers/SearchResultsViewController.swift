//
//  SearchResultsViewController.swift
//  SimonsVoss-Challenge
//
//  Created by Pavel Palancica on 29.03.2023.
//

import UIKit

final class SearchResultsViewController: UITableViewController {
    
    internal var viewModels: [LockCellViewModelType] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    internal var text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: LockTableViewCell.identifier, bundle: nil),
                           forCellReuseIdentifier: LockTableViewCell.identifier)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModels.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LockTableViewCell.identifier)
        guard let lockCell = cell as? LockTableViewCell else { return UITableViewCell() }
        let lockViewModel = viewModels[indexPath.row]
        
        lockCell.configure(with: lockViewModel)
        
        return lockCell
    }
    
    func updateUI() {
        tableView.reloadData()
    }
}
