//
//  LockListViewModelTests.swift
//  SimonsVoss-ChallengeTests
//
//  Created by Pavel Palancica on 02.04.2023.
//

import XCTest
@testable import SimonsVoss_Challenge

final class LockListViewModelTests: XCTestCase {
    
    var lockListVM: LockListViewModel!
    
    @MainActor
    override func setUp() {
        super.setUp()
        lockListVM = LockListViewModel(service: MockLocksDataService(client: MockHTTPClient()))
    }
    
    override func tearDown() {
        super.tearDown()
        lockListVM = nil
    }
    
    func testCreatePresentation_wasSuccessful() async {
        await lockListVM.createPresentation()
        
        let itemsCount = 48
        
        XCTAssertEqual(lockListVM.title.value, "Locks")
        XCTAssertEqual(lockListVM.numberOfItems, itemsCount)
        XCTAssertEqual(lockListVM.cellViewModels.value.count, itemsCount)
        XCTAssertNil(lockListVM.error.value)
        XCTAssertFalse(lockListVM.isLoading.value)
        XCTAssertNotNil(lockListVM.viewModel(at: 0))
        XCTAssertNotNil(lockListVM.viewModel(at: itemsCount - 1))
        XCTAssertNil(lockListVM.viewModel(at: -1))
        XCTAssertNil(lockListVM.viewModel(at: itemsCount))
    }
}
