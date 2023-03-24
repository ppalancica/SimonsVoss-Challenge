//
//  LockListViewController+UITableViewDataSource.swift
//  SimonsVoss-Challenge
//
//  Created by Pavel Palancica on 23.03.2023.
//

import UIKit

extension LockListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = viewModel.viewModel(at: indexPath.row)
        let reuseIdentifier = String(describing: UITableViewCell.self)
        let lockCell: UITableViewCell
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) {
            lockCell = cell
        } else {
            lockCell = UITableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
        }
        
        lockCell.selectionStyle = .none
        lockCell.textLabel?.text = cellViewModel?.lockName
        
        return lockCell
    }
}
