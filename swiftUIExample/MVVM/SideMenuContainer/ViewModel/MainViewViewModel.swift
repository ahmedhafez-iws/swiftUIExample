//
//  MainViewViewModel.swift
//  swiftUIExample
//
//  Created by user174699 on 7/9/20.
//  Copyright © 2020 user174699. All rights reserved.
//

import Foundation


class MainViewViewModel {
    
    let step: Int
    
    init(step: Int) {
        self.step = step
    }
    
    func getViewModelForSideMenuContentView() -> SideMenuContentViewModel {
        return SideMenuContentViewModel(step: step)
    }
}
