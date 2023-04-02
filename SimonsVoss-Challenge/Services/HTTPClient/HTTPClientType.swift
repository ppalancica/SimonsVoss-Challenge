//
//  HTTPClientType.swift
//  SimonsVoss-Challenge
//
//  Created by Pavel Palancica on 24.03.2023.
//

import Foundation

protocol HTTPClientType {
    
    func getData(from url: URL) async throws -> Data
}
