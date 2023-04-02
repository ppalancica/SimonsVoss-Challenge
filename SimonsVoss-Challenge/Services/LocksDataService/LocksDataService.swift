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
        
        guard let rootPageResponse = try? JSONDecoder().decode(RootPageResponse.self, from: data) else {
            throw Error.errorDecodingData("Could not decode to RootPageResponse type")
        }
        
        return rootPageResponse.asItemsContainer
    }
}

extension LocksDataService {

    enum Error: Swift.Error {
        case errorDecodingData(String)
    }
}
