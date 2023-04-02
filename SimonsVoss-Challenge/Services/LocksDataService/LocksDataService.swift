//
//  LocksDataService.swift
//  SimonsVoss-Challenge
//
//  Created by Pavel Palancica on 23.03.2023.
//

import Foundation

final class LocksDataService: LocksDataServiceType {
    
    private var client: HTTPClientType
    
    init(client: HTTPClientType) {
        self.client = client
    }
    
    func fetchAllItems() async throws -> ItemsContainer {
        let data = try await client.getData(from: APIUrls.rootDataUrl)
        let itemsContainer = try handleResultData(data)
        
        return itemsContainer
    }
}

private extension LocksDataService {
    
    func handleResultData(_ data: Data) throws -> ItemsContainer {
        let root = try JSONDecoder().decode(RootPageResponse.self, from: data)
        
        return root.asItemsContainer
    }
}
