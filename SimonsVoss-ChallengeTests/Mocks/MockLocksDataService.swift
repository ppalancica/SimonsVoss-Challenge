//
//  MockLocksDataService.swift
//  SimonsVoss-ChallengeTests
//
//  Created by Pavel Palancica on 02.04.2023.
//

import Foundation
@testable import SimonsVoss_Challenge

final class MockLocksDataService: LocksDataServiceType, MockableLocksData {
    
    private let client: HTTPClientType
    
    init(client: HTTPClientType) {
        self.client = client
    }
    
    func fetchAllItems() async throws -> ItemsContainer {
        guard let client = client as? MockHTTPClient else {
            fatalError("HTTP Client must be of type \(MockHTTPClient.self)")
        }
        
        let data = try await client.getData(from: APIUrls.rootDataUrl)
        
        do {
            let rootPageResponse = try convertDataToType(data: data, type: RootPageResponse.self)
            return rootPageResponse.asItemsContainer
        } catch {
            print("ERROR: \(error)")
            fatalError("Could not decode to RootPageResponse type")
        }
    }
}
