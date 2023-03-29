//
//  LockListViewModel.swift
//  SimonsVoss-Challenge
//
//  Created by Pavel Palancica on 24.03.2023.
//

import Foundation

protocol LockListViewModelType: Any {
    
    init(service: LocksDataServiceType)
    
    var title: Observable<String> { get }
    var isLoading: Observable<Bool> { get }
    var error: Observable<Error?> { get }
    var cellViewModels: Observable<[LockCellViewModelType]> { get }
    
    func createPresentation()
    var numberOfItems: Int { get }
    func viewModel(at index: Int) -> LockCellViewModelType?
}

final class LockListViewModel: LockListViewModelType {
    
    internal let title: Observable<String> = Observable("")
    internal let isLoading: Observable<Bool> = Observable(false)
    internal let error: Observable<Error?> = Observable(nil)
    internal let cellViewModels: Observable<[LockCellViewModelType]> = Observable([])
    
    private var service: LocksDataServiceType
    
    init(service: LocksDataServiceType) {
        self.service = service
    }
    
    func createPresentation() {
        title.update(with: "Locks")
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
    
    func viewModel(at index: Int) -> LockCellViewModelType? {
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
