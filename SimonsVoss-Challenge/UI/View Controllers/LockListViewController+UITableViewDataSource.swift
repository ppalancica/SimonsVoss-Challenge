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
        let viewModel = viewModel.viewModel(at: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: LockTableViewCell.identifier,
                                                 for: indexPath)
        
        guard let lockCell = cell as? LockTableViewCell,
              let lockViewModel = viewModel else { return UITableViewCell() }
        
        lockCell.configure(with: lockViewModel)
        
        return lockCell
    }
}
