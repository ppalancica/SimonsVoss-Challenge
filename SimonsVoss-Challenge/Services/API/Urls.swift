//
//  Urls.swift
//  SimonsVoss-Challenge
//
//  Created by Pavel Palancica on 25.03.2023.
//

import Foundation

struct APIUrls {
    
    static var rootDataUrl: URL {
        let baseUrl = URL(string: Endpoints.baseUrl.asString)!
        return baseUrl.appendingPathComponent(Endpoints.rootData.asString)
    }
}
