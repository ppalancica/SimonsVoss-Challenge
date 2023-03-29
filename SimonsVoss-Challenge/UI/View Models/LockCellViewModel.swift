//
//  LockCellViewModel.swift
//  SimonsVoss-Challenge
//
//  Created by Pavel Palancica on 24.03.2023.
//

// <lock name>
// <building shortcut> - <floor> - <room number>

import Foundation

protocol LockCellViewModelType: Any {
    
    init(lock: Lock, building: Building)
    
    var lockName: String { get }
    var buildingName: String { get }
    var buildingShortcut: String { get }
    var floor: String { get }
    var roomNumber: String { get }
}

struct LockCellViewModel: LockCellViewModelType {
    
    private let lock: Lock
    private let building: Building
    
    init(lock: Lock, building: Building) {
        self.lock = lock
        self.building = building
    }
    
    var lockName: String {
        return lock.name
    }
    
    var buildingName: String {
        return building.name
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
