//
//  SideMenuContentView.swift
//  swiftUIExample
//
//  Created by user174699 on 7/12/20.
//  Copyright © 2020 user174699. All rights reserved.
//

import SwiftUI

struct SideMenuContentView: View {
    
    var viewModel: SideMenuContentViewModel
    @Binding var showMenu: Bool
    let eweListingViewModel: EweListingViewModel
    
    init(viewModel: SideMenuContentViewModel, showMenu: Binding<Bool>) {
        self.viewModel = viewModel
        self._showMenu = showMenu
        self.eweListingViewModel = self.viewModel.getViewModelForEweListing()
    }
    
    var body: some View {
        EweListingView(viewModel: eweListingViewModel, showMenu: self.$showMenu)
    }
}

struct SideMenuContentView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuContentView(viewModel: SideMenuContentViewModel(step: 0), showMenu: .constant(false))
    }
}
