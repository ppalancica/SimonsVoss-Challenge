//
//  GroupDTO.swift
//  SimonsVoss-Challenge
//
//  Created by Pavel Palancica on 25.03.2023.
//

import Foundation

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
