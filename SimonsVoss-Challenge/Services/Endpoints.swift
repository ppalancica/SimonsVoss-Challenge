//
//  Endpoints.swift
//  SimonsVoss-Challenge
//
//  Created by Pavel Palancica on 24.03.2023.
//

import Foundation

enum Endpoints: String {
    
    case rootData = "sv_lsm_data.json"
    
    var asString: String {
        return self.rawValue
    }
}
