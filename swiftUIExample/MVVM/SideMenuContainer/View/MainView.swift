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
    @State var showMenu = false
    let sideMenuContentViewModel: SideMenuContentViewModel
    
    init(viewModel: MainViewViewModel) {
        self.viewModel = viewModel
        sideMenuContentViewModel = self.viewModel.getViewModelForSideMenuContentView()
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                SideMenuContentView(viewModel: self.sideMenuContentViewModel, showMenu: self.$showMenu)
                .frame(width: geometry.size.width, height: geometry.size.height)
                .offset(x: self.showMenu ? min(geometry.size.width * (2/3), 400) : 0)
                .disabled(self.showMenu ? true : false)
                if self.showMenu {
                    MenuView(showMenu: self.$showMenu)
                    .frame(width: min(geometry.size.width * (2/3), 400))
                    .transition(.move(edge: .leading))
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewViewModel(step: 0))
    }
}
