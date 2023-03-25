//
//  LocksDataService.swift
//  SimonsVoss-Challenge
//
//  Created by Pavel Palancica on 23.03.2023.
//

import Foundation

class LocksDataService {
    
    private var client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func fetchAllItems(completion: @escaping (Result<ItemsContainer, Error>) -> Void) {
        client.getData { [weak self] result in
            guard let strongSelf = self else { return }
            strongSelf.handleResult(result, completion: completion)
        }
    }
}

private extension LocksDataService {
    
    func handleResult(_ result: Result<Data, Error>,
                      completion: @escaping (Result<ItemsContainer, Error>) -> Void) {
        switch result {
            case .success(let data):
                do {
                    let root = try JSONDecoder().decode(RootPageResponse.self, from: data)
                    completion(.success(root.asItemsContainer))
                } catch {
                    completion(.failure(error))
                }
            
            case .failure(let error):
                completion(.failure(error))
        }
    }
}
