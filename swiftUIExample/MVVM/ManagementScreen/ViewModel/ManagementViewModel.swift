//
//  ManagementViewModel.swift
//  swiftUIExample
//
//  Created by user174699 on 7/9/20.
//  Copyright © 2020 user174699. All rights reserved.
//

import Foundation

class ManagementViewModel {
    
    private (set) var step: Int
    
    init() {
        self.step = 0
    }
    
    func getViewModelForLoginView(step: Int) -> LoginViewModel {
        self.step = step
        return LoginViewModel()
    }
    
    func getViewModelForMainView() -> MainViewViewModel {
        return MainViewViewModel(step: step)
    }
}
