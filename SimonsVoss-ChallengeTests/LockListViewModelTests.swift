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
        XCTAssertEqual(lockListVM.numberOfItems, 48)
    }
}
