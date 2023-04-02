//
//  LocksDataServiceType.swift
//  SimonsVoss-Challenge
//
//  Created by Pavel Palancica on 30.03.2023.
//

import Foundation

protocol LocksDataServiceType: Any {
    
    init(client: HTTPClientType)
    
    func fetchAllItems() async throws -> ItemsContainer
}
