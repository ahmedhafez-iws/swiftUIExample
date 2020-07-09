//
//  LauncherView.swift
//  swiftUIExample
//
//  Created by user174699 on 7/9/20.
//  Copyright © 2020 user174699. All rights reserved.
//

import SwiftUI

struct LauncherView: View {
    
    var viewModel: LauncherViewModel
    
    var body: some View {
        Group {
            if viewModel.isLoggedIn {
                MainView(viewModel: viewModel.getViewModelForMainView())
            }
            else {
                ContentView(viewModel: viewModel.getViewModelForManagementView())
            }
        }
    }
}

struct LauncherView_Previews: PreviewProvider {
    static var previews: some View {
        LauncherView(viewModel: LauncherViewModel())
    }
}
