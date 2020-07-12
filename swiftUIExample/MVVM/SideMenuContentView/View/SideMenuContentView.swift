//
//  SideMenuContentView.swift
//  swiftUIExample
//
//  Created by user174699 on 7/12/20.
//  Copyright © 2020 user174699. All rights reserved.
//

import SwiftUI

struct SideMenuContentView: View {
    
    var openMenuClosure: () -> Void
    var viewModel: SideMenuContentViewModel
    let eweListingViewModel: EweListingViewModel
    
    init(viewModel: SideMenuContentViewModel, openMenuClosure: @escaping () -> Void) {
        self.viewModel = viewModel
        self.openMenuClosure = openMenuClosure
        self.eweListingViewModel = self.viewModel.getViewModelForEweListing()
    }
    
    var body: some View {
        EweListingView(viewModel: eweListingViewModel, openMenuClosure: openMenuClosure)
    }
}

struct SideMenuContentView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuContentView(viewModel: SideMenuContentViewModel(step: 0), openMenuClosure: {
            
        })
    }
}
