//
//  LauncherViewMoel.swift
//  swiftUIExample
//
//  Created by user174699 on 7/9/20.
//  Copyright © 2020 user174699. All rights reserved.
//

import Foundation

class LauncherViewModel {

    var isLoggedIn: Bool {
        return true
    }
    
    func getViewModelForMainView() -> MainViewViewModel {
        return MainViewViewModel(step: 0)
    }
    
    func getViewModelForManagementView() -> ManagementViewModel {
        return ManagementViewModel()
    }
}
