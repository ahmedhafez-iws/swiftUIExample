//
//  Enums.swift
//  swiftUIExample
//
//  Created by user174699 on 7/9/20.
//  Copyright © 2020 user174699. All rights reserved.
//

import Foundation

class Enums {
    
    public enum StatusCode: Int {
        case CODE_OK = 200
        case CREATED_OK = 201
        case NO_CONTENT = 204
        case UN_AUTHORIZED = 401
        case NOT_FOUND = 404
        case FORBIDDEN = 403
        case UNPROCESSABLE_ENTITY = 422
        case CONFLICT = 409
    }
    
    public enum DeliveryType: String {
        case normal = "1"
        case syserian = "2"
    }
}
