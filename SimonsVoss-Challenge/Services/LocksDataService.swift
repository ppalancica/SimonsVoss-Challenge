//
//  LocksDataService.swift
//  SimonsVoss-Challenge
//
//  Created by Pavel Palancica on 23.03.2023.
//

import Foundation

class LocksDataService {
    
    func getAll(completion: @escaping (Result<RootPageResponse, Error>) -> Void) {
        let buildingUUID = UUID(uuidString: "0cccab2b-bc8d-44c5-b248-8a9ca6d7e899")!
        
        let locks: [Lock] = [
            Lock(id: UUID(),
                 buildingId: buildingUUID,
                 type: "Cylinder",
                 name: "Gästezimmer 4.OG",
                 description: "null",
                 serialNumber: "UID-A89F98F3",
                 floor: "4.OG",
                 roomNumber: "454"),
            Lock(id: UUID(),
                 buildingId: buildingUUID,
                 type: "Cylinder",
                 name: "WC Herren 3.OG süd",
                 description: "null",
                 serialNumber: "UID-C043133A",
                 floor: "3.OG",
                 roomNumber: "WC.HL")
        ]
        
        let buildings: [Building] = [
            Building(
                id: buildingUUID,
                shortCut: "HOFF",
                name: "Head Office",
                description: "Head Office, Feringastraße 4, 85774 Unterföhring"
            )
        ]
        
        let response = RootPageResponse(buildings: buildings, groups: [], locks: locks, media: [])
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            completion(.success(response))
        }
    }
}
