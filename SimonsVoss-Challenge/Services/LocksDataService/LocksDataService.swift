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
    
    func fetchAllItems(completion: @escaping (Result<ItemsContainer, LocksDataServiceError>) -> Void) {
        client.getData(from: APIUrls.rootDataUrl) { [weak self] result in
            guard let strongSelf = self else { return }
            strongSelf.handleResult(result, completion: completion)
        }
    }
}

private extension LocksDataService {
    
    func handleResult(_ result: Result<Data, HTTPClientError>,
                      completion: @escaping (Result<ItemsContainer, LocksDataServiceError>) -> Void) {
        switch result {
            case .success(let data):
                do {
                    let root = try JSONDecoder().decode(RootPageResponse.self, from: data)
                    completion(.success(root.asItemsContainer))
                } catch {
                    completion(.failure(.dataInvalid(error.localizedDescription)))
                }
            
            case .failure(let error):
                completion(.failure(.connectionOrWebIssue(error.localizedDescription)))
        }
    }
}
