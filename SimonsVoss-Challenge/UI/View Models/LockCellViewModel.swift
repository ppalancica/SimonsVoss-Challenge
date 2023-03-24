//
//  LockCellViewModel.swift
//  SimonsVoss-Challenge
//
//  Created by Pavel Palancica on 24.03.2023.
//

import Foundation

struct LockCellViewModel {
    let lockName: String
    
    init(lock: Lock) {
        self.lockName = lock.name
    }
}
