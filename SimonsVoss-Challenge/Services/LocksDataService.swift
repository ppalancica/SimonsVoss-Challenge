//
//  LocksDataService.swift
//  SimonsVoss-Challenge
//
//  Created by Pavel Palancica on 23.03.2023.
//

import Foundation

class LocksDataService {
    
    func getAll(completion: @escaping (Result<RootPageResponse, Error>) -> Void) {
        HTTPClient().getRootData { [weak self] result in
            guard let strongSelf = self else { return }
            strongSelf.handleGetAllResult(result, completion: completion)
        }
    }
}

private extension LocksDataService {
    
    func handleGetAllResult(_ result: Result<Data, Error>,
                            completion: @escaping (Result<RootPageResponse, Error>) -> Void) {
        switch result {
            case .success(let data):
                do {
                    let root = try JSONDecoder().decode(RootPageResponse.self, from: data)
                    completion(.success(root))
                } catch {
                    completion(.failure(error))
                }
            
            case .failure(let error):
                completion(.failure(error))
        }
    }
}
