//
//  MockHTTPClient.swift
//  SimonsVoss-ChallengeTests
//
//  Created by Pavel Palancica on 02.04.2023.
//

import Foundation
@testable import SimonsVoss_Challenge

final class MockHTTPClient: HTTPClientType, MockableHTTP {
    
    func getData(from url: URL) async throws -> Data {
        return loadJSON(fileName: "RootPageResponse")
    }
}
