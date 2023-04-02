//
//  LockListViewModelType.swift
//  SimonsVoss-Challenge
//
//  Created by Pavel Palancica on 30.03.2023.
//

import Foundation

protocol LockListViewModelType: Any {
    
    var title: Observable<String> { get }
    var isLoading: Observable<Bool> { get }
    var error: Observable<Error?> { get }
    var cellViewModels: Observable<[LockCellViewModelType]> { get }
    
    @MainActor func createPresentation() async
    var numberOfItems: Int { get }
    func viewModel(at index: Int) -> LockCellViewModelType?
    
    var onError: ((Error) -> Void)? { get }
}
