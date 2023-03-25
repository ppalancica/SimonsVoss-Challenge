//
//  RootPageResponse.swift
//  SimonsVoss-Challenge
//
//  Created by Pavel Palancica on 24.03.2023.
//

import Foundation

struct RootPageResponse: Decodable {
    let buildings: [BuildingDTO]
    let groups: [GroupDTO]
    let locks: [LockDTO]
    let media: [MediumDTO]
    
    var asItemsContainer: ItemsContainer {
        return ItemsContainer(buildings: buildings.map { $0.asBuilding },
                              groups: groups.map { $0.asGroup },
                              locks: locks.map { $0.asLock },
                              media: media.map { $0.asMedium })
    }
}

struct BuildingDTO: Decodable {
    let id: UUID?
    let shortCut: String?
    let name: String?
    let description: String?
    
    var asBuilding: Building {
        return Building(id: id ?? UUID(),
                        shortCut: shortCut ?? "",
                        name: name ?? "",
                        description: description ?? "")
    }
}

struct GroupDTO: Decodable {
    let id: UUID?
    let name: String?
    let description: String?
    
    var asGroup: Group {
        return Group(id: id ?? UUID(),
                     name: name ?? "",
                     description: description ?? "")
    }
}

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

struct MediumDTO: Decodable {
    let id: UUID?
    let groupId: UUID?
    let type: String?
    let owner: String?
    let description: String?
    let serialNumber: String?
    
    var asMedium: Medium {
        return Medium(id: id ?? UUID(),
                      groupId: id ?? UUID(),
                      type: type ?? "",
                      owner: owner ?? "",
                      description: description ?? "",
                      serialNumber: serialNumber ?? "")
    }
}
