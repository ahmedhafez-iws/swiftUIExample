//
//  ListingResponseLinks.swift
//  swiftUIExample
//
//  Created by user174699 on 7/9/20.
//  Copyright © 2020 user174699. All rights reserved.
//

import Foundation

struct ListingResponseLinks: Codable {
    
    var first: String
    var last: String
    var previous: String?
    var next: String?
    
    enum CodingKeys: String, CodingKey {
        case first = "first"
        case last = "last"
        case previous = "prev"
        case next = "next"
    }
}
