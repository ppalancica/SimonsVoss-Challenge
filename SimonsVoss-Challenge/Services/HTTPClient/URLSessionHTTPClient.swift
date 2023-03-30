//
//  URLSessionHTTPClient.swift
//  SimonsVoss-Challenge
//
//  Created by Pavel Palancica on 30.03.2023.
//

import Foundation

final class URLSessionHTTPClient: HTTPClientType {
        
    func getData(
        from url: URL,
        completion: @escaping (Result<Data, HTTPClientError>) -> Void
    ) {
        let session = URLSession.shared
        
        session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.httpError(error.localizedDescription)))
                return
            }
            
            guard let data = data,
                let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.badResponse("HTTP response status code was not 200")))
                return
            }
            
            completion(.success(data))
        }.resume()
    }
}
