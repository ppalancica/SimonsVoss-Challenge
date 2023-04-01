//
//  SearchResultsViewController.swift
//  SimonsVoss-Challenge
//
//  Created by Pavel Palancica on 29.03.2023.
//

import UIKit

final class SearchResultsViewController: UITableViewController {
    
    private var viewModels: [LockCellViewModelType] = []
    private var text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: LockTableViewCell.identifier, bundle: nil),
                           forCellReuseIdentifier: LockTableViewCell.identifier)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let lockCell = tableView.dequeueReusableCell(
            withIdentifier: LockTableViewCell.identifier,
            for: indexPath
        ) as? LockTableViewCell else { return UITableViewCell() }
        
        let lockViewModel = viewModels[indexPath.row]
        
        lockCell.configure(with: lockViewModel,
                           textToHighlight: text)
        
        return lockCell
    }
    
    func updateUIForSearchText(_ text: String, viewModels: [LockCellViewModelType]) {
        self.text = text
        self.viewModels = viewModels
        tableView.reloadData()
    }
}
