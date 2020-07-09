//
//  EweListingResponse.swift
//  swiftUIExample
//
//  Created by user174699 on 7/9/20.
//  Copyright © 2020 user174699. All rights reserved.
//

import Foundation

struct EweListingResponse: Codable {
    
    var data: [EweInfo]
    var links: ListingResponseLinks
    var meta: ListingResponseMeta
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case links = "links"
        case meta = "meta"
    }
}

