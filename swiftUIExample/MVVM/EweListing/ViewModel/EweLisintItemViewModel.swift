//
//  EweLisintItemViewModel.swift
//  swiftUIExample
//
//  Created by user174699 on 7/9/20.
//  Copyright © 2020 user174699. All rights reserved.
//

import Foundation

class EweListingItemViewModel {
    
    private var eweInfo: EweInfo
    
    init(_ eweInfo: EweInfo) {
        self.eweInfo = eweInfo
    }
    
    var eweId: String {
        eweInfo.id
    }
    
    var eweGender: String {
        eweInfo.gender
    }
    
    var genderIcon: String {
        if eweGender == "ذكر" {
            return "male_sign"
        }
        
        return "female_sign"
    }
    
    var deliveryTypeIcon: String {
        guard let type = eweInfo.deliveryType, let deliveryType = Enums.DeliveryType(rawValue: type) else {
            return ""
        }
        
        switch deliveryType {
        case .normal:
            return "ic_normal"
        case .syserian:
            return "ic_syserian"
        }
    }
    
    var isBirthExist: Bool {
        guard deliveryTypeIcon == "" , birthDate == "" else {
            return true
        }
        
        return false
    }
    
    var birthDate: String {
        return eweInfo.birthDate ?? ""
    }
    
    var thumbnailPlaceholder: String {
        if eweGender == "ذكر" {
            return "male_placeholder"
        }
        
        return "female_placeholder"
    }
    
//    var thumbnailUrl: String {
//        guard let url = eweInfo.profileImage else {
//            return ""
//        }
//
//        return HelperMethods.getFormattedUrlFrom(url)
//    }
    
    var isStationExixst: Bool {
        station != ""
    }
    
    var station: String {
        return eweInfo.station ?? ""
    }
}
