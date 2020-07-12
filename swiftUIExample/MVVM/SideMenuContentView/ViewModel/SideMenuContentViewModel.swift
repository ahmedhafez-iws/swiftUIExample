//
//  SideMenuContentViewModel.swift
//  swiftUIExample
//
//  Created by user174699 on 7/12/20.
//  Copyright © 2020 user174699. All rights reserved.
//

import Foundation

class SideMenuContentViewModel {
    
    let step: Int
    let eweListingViewModel: EweListingViewModel
    
    init(step: Int) {
        self.step = step
        self.eweListingViewModel = EweListingViewModel()
    }
    
    func getViewModelForEweListing() -> EweListingViewModel {
        return eweListingViewModel
    }
}
