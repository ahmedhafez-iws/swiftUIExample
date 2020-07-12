//
//  DraggableSideMenu.swift
//  swiftUIExample
//
//  Created by user174699 on 7/12/20.
//  Copyright © 2020 user174699. All rights reserved.
//

import SwiftUI

struct DraggableSideMenu: View {
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
                Color((self.showMenu ? UIColor(named: "primary_color") : UIColor.clear) ?? UIColor.white)
                .edgesIgnoringSafeArea(.all)
                
                ZStack {
                    GeometryReader { gem in
                        ZStack {
                            ShadowView().frame(width: gem.size.width, height: gem.size.height - 40)
                                .background(Color.white)
                            .cornerRadius(7)
                            
                            ShadowView().frame(width: gem.size.width - 30, height: gem.size.height)
                                .background(Color.white)
                            .cornerRadius(7)
                        }
                    }
                }
                .frame(width: geometry.size.width, height: self.showMenu ? geometry.size.height - 140 : geometry.size.height)
                .disabled(self.showMenu ? true : false)
                .offset(x: self.showMenu ? min(geometry.size.width * (2/3), 400) - 30 : 0)
                .clipped()
                .opacity(0.6)
                
                
                MenuView(showMenu: self.$showMenu)
                .frame(width: min(geometry.size.width * (2/3), 400))
                .transition(.move(edge: .leading))
                .transition(.opacity)
                .scaleEffect(self.showMenu ? 1.0 : 1.5)
                
//                if self.showMenu {
//
//                }
                
                SideMenuContentView(viewModel: self.sideMenuContentViewModel, showMenu: self.$showMenu)
                .frame(width: geometry.size.width, height: self.showMenu ? geometry.size.height - 100 : geometry.size.height)
                .disabled(self.showMenu ? true : false)
                .cornerRadius(self.showMenu ? 10 : 0)
                .offset(x: self.showMenu ? min(geometry.size.width * (2/3), 400) : 0)
            }
        }
    }
}

struct ShadowView: View {
    var body: some View {
        VStack {
            Spacer()
        }
        .background(Color.white)
    }
}

struct DraggableSideMenu_Previews: PreviewProvider {
    static var previews: some View {
        DraggableSideMenu(viewModel: MainViewViewModel(step: 0))
    }
}
