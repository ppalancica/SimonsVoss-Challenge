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
