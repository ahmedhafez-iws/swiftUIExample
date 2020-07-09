//
//  ListingResponseMeta.swift
//  swiftUIExample
//
//  Created by user174699 on 7/9/20.
//  Copyright © 2020 user174699. All rights reserved.
//

import Foundation

struct ListingResponseMeta: Codable {
    
    var currentPage: Int
    var from: Int?
    var lastPage: Int
    var path: String
//    var itemsInPage: Int
    var to: Int?
    var total: Int
    
    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case from = "from"
        case lastPage = "last_page"
        case path = "path"
//        case itemsInPage = "per_page"
        case to = "to"
        case total = "total"
    }
}
