//
//  LockListViewController+UISearchBarDelegate.swift
//  SimonsVoss-Challenge
//
//  Created by Pavel Palancica on 29.03.2023.
//

import UIKit

extension LockListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let searchResultsVC = searchController
            .searchResultsController
                as? SearchResultsViewController else { return }
        
        searchResultsVC.viewModels = viewModelsFor(searchText: searchText.lowercased())
        searchResultsVC.updateUI()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
    }
}

extension LockListViewController {
    
    private func viewModelsFor(searchText text: String) -> [LockCellViewModelType] {
        var viewModels: [LockCellViewModelType] = []
        
        for cellVM in viewModel.cellViewModels.value {
            let lockName = cellVM.lockName.lowercased()
            let buildingName = cellVM.buildingName.lowercased()
            let buildingShortcut = cellVM.buildingShortcut.lowercased()
            let floor = cellVM.floor.lowercased()
            let roomNumber = cellVM.roomNumber.lowercased()
            
            if [lockName, buildingName, buildingShortcut, floor, roomNumber].contains(text) {
                viewModels.append(cellVM)
            }
        }
        
        return viewModels
    }
}
