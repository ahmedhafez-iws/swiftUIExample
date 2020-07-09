//
//  MainView.swift
//  swiftUIExample
//
//  Created by user174699 on 7/9/20.
//  Copyright © 2020 user174699. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    var viewModel: MainViewViewModel
    
    var body: some View {
        GeometryReader { geometry in
            EweListingView(viewModel: self.viewModel.getViewModelForEweListing())
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewViewModel(step: 0))
    }
}
