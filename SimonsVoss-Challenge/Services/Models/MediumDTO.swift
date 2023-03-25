//
//  MediumDTO.swift
//  SimonsVoss-Challenge
//
//  Created by Pavel Palancica on 25.03.2023.
//

import Foundation

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
