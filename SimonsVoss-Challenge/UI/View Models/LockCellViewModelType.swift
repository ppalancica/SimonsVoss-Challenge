//
//  LockCellViewModelType.swift
//  SimonsVoss-Challenge
//
//  Created by Pavel Palancica on 30.03.2023.
//

import Foundation

protocol LockCellViewModelType: Any {
    
    var lockName: String { get }
    var buildingName: String { get }
    var buildingShortcut: String { get }
    var floor: String { get }
    var roomNumber: String { get }
}
