//
//  LocksDataService.swift
//  SimonsVoss-Challenge
//
//  Created by Pavel Palancica on 23.03.2023.
//

import Foundation

enum LocksDataServiceError: Error {
    case connectionOrWebIssue(String)
    case dataInvalid(String)
}

protocol LocksDataServiceType: Any {
    
    init(client: HTTPClient)
    
    func fetchAllItems(completion: @escaping (Result<ItemsContainer, LocksDataServiceError>) -> Void)
}

final class LocksDataService: LocksDataServiceType {
    
    private var client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func fetchAllItems(completion: @escaping (Result<ItemsContainer, LocksDataServiceError>) -> Void) {
        client.getData(from: APIUrls.rootDataUrl) { [weak self] result in
            guard let strongSelf = self else { return }
            strongSelf.handleResult(result, completion: completion)
        }
    }
}

private extension LocksDataService {
    
    func handleResult(_ result: Result<Data, Error>,
                      completion: @escaping (Result<ItemsContainer, LocksDataServiceError>) -> Void) {
        switch result {
            case .success(let data):
                do {
                    let root = try JSONDecoder().decode(RootPageResponse.self, from: data)
                    completion(.success(root.asItemsContainer))
                } catch {
                    completion(.failure(.dataInvalid("Could not decode to RootPageResponse")))
                }
            
            case .failure(let error):
                completion(.failure(.connectionOrWebIssue(error.localizedDescription)))
        }
    }
}
