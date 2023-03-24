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
        service.getAll { [weak self] result in
            DispatchQueue.main.async {
                guard let strongSelf = self else { return }
                strongSelf.isLoading.update(with: false)
                strongSelf.handleLoadAllResult(result)
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
    
    func handleLoadAllResult(_ result: Result<RootPageResponse, Error>) {
        switch result {
            case .success(let response):
                let viewModels = createCellViewModels(from: response)
                cellViewModels.update(with: viewModels)
            case .failure(let serviceError):
                error.update(with: serviceError)
        }
    }
    
    func createCellViewModels(from response: RootPageResponse) -> [LockCellViewModel] {
        let viewModels = response.locks.map(LockCellViewModel.init)
        return viewModels
    }
}
