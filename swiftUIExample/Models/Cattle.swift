//
//  Cattle.swift
//  swiftUIExample
//
//  Created by user174699 on 7/9/20.
//  Copyright © 2020 user174699. All rights reserved.
//

import Foundation

struct Cattle: Codable {
    
    var cattle: String
    var cattleId: Int
    
    enum CodingKeys: String, CodingKey {
        case cattle = "name"
        case cattleId = "id"
    }
}
