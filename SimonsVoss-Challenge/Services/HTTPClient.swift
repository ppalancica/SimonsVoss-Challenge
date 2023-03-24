//
//  HTTPClient.swift
//  SimonsVoss-Challenge
//
//  Created by Pavel Palancica on 24.03.2023.
//

import Foundation

private struct HTTPClientError: Error {}

class HTTPClient {
    
    private let baseURL = URL(string: "https://dev.homework.system3060.com")!
    
    func getRootData(completion: @escaping (Result<Data, Error>) -> Void) {
        let url = baseURL.appendingPathComponent(Endpoints.rootData.asString)
        let session = URLSession.shared
        
        session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data,
                let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(HTTPClientError()))
                return
            }
            
            completion(.success(data))
        }.resume()
    }
}
