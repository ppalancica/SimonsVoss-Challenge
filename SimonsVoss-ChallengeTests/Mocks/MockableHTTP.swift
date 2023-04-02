//
//  MockableHTTP.swift
//  SimonsVoss-ChallengeTests
//
//  Created by Pavel Palancica on 02.04.2023.
//

import Foundation

protocol MockableHTTP: AnyObject {
    
    var bundle: Bundle { get }
    
    func loadJSON(fileName: String) -> Data
}

extension MockableHTTP {
    
    var bundle: Bundle {
        return Bundle(for: type(of: self))
    }

    func loadJSON(fileName: String) -> Data {
        guard let path = bundle.url(forResource: fileName, withExtension: "json") else {
            fatalError("Failed to load Test Bundle JSON file")
        }
        
        do {
            let data = try Data(contentsOf: path)
            return data
        } catch {
            print("ERROR: \(error)")
            fatalError("Failed to decode the JSON from \(bundle)")
        }
    }
}
