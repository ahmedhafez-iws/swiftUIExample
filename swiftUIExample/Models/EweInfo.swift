//
//  EweInfo.swift
//  swiftUIExample
//
//  Created by user174699 on 7/9/20.
//  Copyright © 2020 user174699. All rights reserved.
//

import Foundation

struct EweInfo: Codable {
    
    var id: String
    var gender: String
    var cattle: Cattle?
    var fatherId: String?
    var motherId: String?
    var station: String?
    var description: String?
    var deliveryType: String?
    var ablactationWeight: String?
    var ageAtBuying: String?
    var disposalReason: String?
    var birthDate: String?
    var ablactationDate: String?
    var buyingDate: String?
    var disposalDate: String?
    var createdAt: String?
    var updatedAt: String?
    var profileImage: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case gender = "gender"
        case cattle = "cattle"
        case fatherId = "father_id"
        case motherId = "mother_id"
        case station = "station"
        case description = "description"
        case deliveryType = "delivery_type"
        case ablactationWeight = "ablactation_weight"
        case ageAtBuying = "age_at_buying"
        case disposalReason = "disposal_reason"
        case birthDate = "date_of_birth"
        case ablactationDate = "ablactation_date"
        case buyingDate = "buying_date"
        case disposalDate = "disposal_date"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case profileImage = "profile_image"
    }
}
