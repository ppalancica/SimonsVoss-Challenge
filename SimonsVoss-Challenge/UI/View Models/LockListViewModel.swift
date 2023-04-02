//
//  LockListViewModel.swift
//  SimonsVoss-Challenge
//
//  Created by Pavel Palancica on 24.03.2023.
//

import Foundation

@MainActor
final class LockListViewModel: LockListViewModelType {
    
    nonisolated internal let title: Observable<String> = Observable("")
    nonisolated internal let isLoading: Observable<Bool> = Observable(false)
    nonisolated internal let error: Observable<Error?> = Observable(nil)
    nonisolated internal let cellViewModels: Observable<[LockCellViewModelType]> = Observable([])
    
    private var service: LocksDataServiceType
    
    var onError: ((Error) -> Void)?
    
    init(service: LocksDataServiceType) {
        self.service = service
    }
    
    func createPresentation() async {
        guard !isLoading.value else { return }
        
        title.update(with: "Locks")
        isLoading.update(with: true)
        
        do {
            let itemsContainer = try await service.fetchAllItems()
            let viewModels = createCellViewModels(from: itemsContainer)
            cellViewModels.update(with: viewModels)
        } catch (let serviceError) {
            error.update(with: serviceError)
            onError?(serviceError)
        }
        
        isLoading.update(with: false)
    }
    
    nonisolated var numberOfItems: Int {
        return cellViewModels.value.count
    }
    
    nonisolated func viewModel(at index: Int) -> LockCellViewModelType? {
        guard index >= 0 && index < numberOfItems else {
            return nil
        }
        return cellViewModels.value[index]
    }
}

private extension LockListViewModel {
    
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
