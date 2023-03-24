//
//  LockCellViewModel.swift
//  SimonsVoss-Challenge
//
//  Created by Pavel Palancica on 24.03.2023.
//

// <lock name>
// <building shortcut> - <floor> - <room number>

import Foundation

struct LockCellViewModel {
    
    private let lock: Lock
    private let building: Building
    
    init(lock: Lock, building: Building) {
        self.lock = lock
        self.building = building
    }
    
    var lockName: String {
        return lock.name
    }
    
    var buildingShortcut: String {
        return building.shortCut
    }
    
    var floor: String {
        return lock.floor
    }
    
    var roomNumber: String {
        return lock.roomNumber
    }
}
