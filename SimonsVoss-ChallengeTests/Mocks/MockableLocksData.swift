//
//  MockableLocksData.swift
//  SimonsVoss-ChallengeTests
//
//  Created by Pavel Palancica on 02.04.2023.
//

import Foundation
@testable import SimonsVoss_Challenge

protocol MockableLocksData: AnyObject {
    
    func convertDataToType<T: Decodable>(data: Data, type: T.Type) throws -> T
}

extension MockableLocksData {
    
    func convertDataToType<T: Decodable>(data: Data, type: T.Type) throws -> T {
        guard let result = try? JSONDecoder().decode(T.self, from: data) else {
            throw Error.errorDecodingData("Could not decode to \(T.self) type")
        }
        return result
    }
}

fileprivate enum Error: Swift.Error {
    case errorDecodingData(String)
}
