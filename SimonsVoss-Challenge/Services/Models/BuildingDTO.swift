//
//  BuildingDTO.swift
//  SimonsVoss-Challenge
//
//  Created by Pavel Palancica on 25.03.2023.
//

import Foundation

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
