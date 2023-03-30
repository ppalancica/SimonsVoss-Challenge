//
//  HTTPClientType.swift
//  SimonsVoss-Challenge
//
//  Created by Pavel Palancica on 24.03.2023.
//

import Foundation

enum HTTPClientError: Error {
    case httpError(String)
    case badResponse(String)
}

protocol HTTPClientType {
    
    func getData(
        from url: URL,
        completion: @escaping (Result<Data, HTTPClientError>) -> Void
    )
}
