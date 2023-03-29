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
        
        searchResultsVC.viewModels = viewModelsForSearchText(searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
    }
}

extension LockListViewController {
    
    private func viewModelsForSearchText(_ text: String) -> [LockCellViewModelType] {
        let searchText = text.lowercased()
        var viewModels: [LockCellViewModelType] = []
        
        for cellVM in viewModel.cellViewModels.value {
            if cellVM.somePropertyMatches(text: searchText) {
                viewModels.append(cellVM)
            }
        }
        
        return viewModels
    }
}

private extension LockCellViewModelType {
    
    func somePropertyMatches(text: String) -> Bool {
        let lockName = lockName.lowercased()
        let buildingName = buildingName.lowercased()
        let buildingShortcut = buildingShortcut.lowercased()
        let floor = floor.lowercased()
        let roomNumber = roomNumber.lowercased()
        
        for string in [lockName, buildingName, buildingShortcut, floor, roomNumber] {
            if string.contains(text) {
                return true
            }
        }
        
        return false
    }
}
