//
//  Endpoints.swift
//  SimonsVoss-Challenge
//
//  Created by Pavel Palancica on 24.03.2023.
//

import Foundation

enum Endpoints: String {
    
    case baseUrl = "https://dev.homework.system3060.com"
    case rootData = "sv_lsm_data.json"
    
    var asString: String {
        return rawValue
    }
}
