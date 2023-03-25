//
//  LockListViewModel.swift
//  SimonsVoss-Challenge
//
//  Created by Pavel Palancica on 24.03.2023.
//

import Foundation

final class LockListViewModel {
    
    internal let isLoading: Observable<Bool> = Observable(false)
    internal let error: Observable<Error?> = Observable(nil)
    internal let cellViewModels: Observable<[LockCellViewModel]> = Observable([])
    
    private var service: LocksDataService
    
    init(service: LocksDataService) {
        self.service = service
    }
    
    func loadAll() {
        isLoading.update(with: true)
        service.fetchAllItems { [weak self] result in
            DispatchQueue.main.async {
                guard let strongSelf = self else { return }
                strongSelf.isLoading.update(with: false)
                strongSelf.handleFetchAllResult(result)
            }
        }
    }
    
    var numberOfItems: Int {
        return cellViewModels.value.count
    }
    
    func viewModel(at index: Int) -> LockCellViewModel? {
        return cellViewModels.value[index]
    }
}

private extension LockListViewModel {
    
    func handleFetchAllResult(_ result: Result<ItemsContainer, Error>) {
        switch result {
            case .success(let response):
                let viewModels = createCellViewModels(from: response)
                cellViewModels.update(with: viewModels)
            case .failure(let serviceError):
                error.update(with: serviceError)
        }
    }
    
    func createCellViewModels(from response: ItemsContainer) -> [LockCellViewModel] {
        let locks = response.locks
        let buildings = response.buildings
        var viewModels: [LockCellViewModel] = []
        
        for lock in locks {
            guard let building = buildings.first(where: { $0.id == lock.buildingId }) else { continue }
            
            viewModels.append(LockCellViewModel(lock: lock,
                                                building: building))
        }
        
        return viewModels
    }
}
