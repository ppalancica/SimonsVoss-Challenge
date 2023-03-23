//
//  LocksDataService.swift
//  SimonsVoss-Challenge
//
//  Created by Pavel Palancica on 23.03.2023.
//

import Foundation

class LocksDataService {
    
    func getAll(completion: @escaping (Result<RootPageResponse, Error>) -> Void) {
        let locks: [Lock] = [
            Lock(id: UUID(),
                 buildingId: UUID(),
                 type: "Cylinder",
                 name: "Gästezimmer 4.OG",
                 description: "null",
                 serialNumber: "UID-A89F98F3",
                 floor: "4.OG",
                 roomNumber: "454")
        ]
        let response = RootPageResponse(buildings: [], groups: [], locks: locks, media: [])
        completion(.success(response))
    }
}
