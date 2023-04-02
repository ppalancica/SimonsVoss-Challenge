//
//  URLSessionHTTPClient.swift
//  SimonsVoss-Challenge
//
//  Created by Pavel Palancica on 30.03.2023.
//

import Foundation

final class URLSessionHTTPClient: HTTPClientType {
    
    private let session: URLSession
    
    init(session: URLSession = URLSession(configuration: .ephemeral)) {
        self.session = session
    }
    
    func getData(from url: URL) async throws -> Data {
        let (data, response) = try await session.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw HTTPClientError.badResponse("HTTP response status code was not 200")
        }
        
        return data
    }
}
