//
//  LockDTO.swift
//  SimonsVoss-Challenge
//
//  Created by Pavel Palancica on 25.03.2023.
//

import Foundation

struct LockDTO: Decodable {
    let id: UUID?
    let buildingId: UUID?
    let type: String?
    let name: String?
    let description: String?
    let serialNumber: String?
    let floor: String?
    let roomNumber: String?
    
    var asLock: Lock {
        return Lock(id: id ?? UUID(),
                    buildingId: buildingId ?? UUID(),
                    type: type ?? "",
                    name: name ?? "",
                    description: description ?? "",
                    serialNumber: serialNumber ?? "",
                    floor: floor ?? "",
                    roomNumber: roomNumber ?? "")
    }
}
