//
//  LocksDataServiceType.swift
//  SimonsVoss-Challenge
//
//  Created by Pavel Palancica on 30.03.2023.
//

import Foundation

enum LocksDataServiceError: Error {
    case connectionOrWebIssue(String)
    case dataInvalid(String)
}

protocol LocksDataServiceType: Any {
    
    init(client: HTTPClientType)
    
    func fetchAllItems(completion: @escaping (Result<ItemsContainer, LocksDataServiceError>) -> Void)
}
