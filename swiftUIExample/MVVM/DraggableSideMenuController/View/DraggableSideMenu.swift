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
    @State var offset: CGFloat = 0
    let sideMenuContentViewModel: SideMenuContentViewModel
    
    init(viewModel: MainViewViewModel) {
        self.viewModel = viewModel
        sideMenuContentViewModel = self.viewModel.getViewModelForSideMenuContentView()
    }
    
    var body: some View {
        
//        let closeDrag = DragGesture()
//        .onChanged { drag in
//            if drag.translation.width < 0 {
//                print("HAFEZ \(drag.translation.width)")
////                self.offset =
//            }
//        }
//        .onEnded {
//            if $0.translation.width < -100 {
//                withAnimation {
//                    self.offset = 0
//                    self.showMenu = false
//                }
//            }
//        }
        
        
        return GeometryReader { geometry in
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
                .offset(x: self.offset - 30)
                .clipped()
                .opacity(0.6)
                
                
                MenuView(closeMenuClosure: {
                    withAnimation {
                        self.offset = 0
                        self.showMenu = false
                    }
                })
                .frame(width: min(geometry.size.width * (2/3), 400))
                .transition(.move(edge: .leading))
                .transition(.opacity)
                .scaleEffect(self.showMenu ? 1.0 : 1.5)
                
                SideMenuContentView(viewModel: self.sideMenuContentViewModel, openMenuClosure: {
                    withAnimation {
                        self.offset = min(geometry.size.width * (2/3), 400)
                        self.showMenu = true
                    }
                })
                .frame(width: geometry.size.width, height: self.showMenu ? geometry.size.height - 100 : geometry.size.height)
                .disabled(self.showMenu ? true : false)
                .cornerRadius(self.showMenu ? 10 : 0)
                    .offset(x: self.offset)
            }
//            .gesture(closeDrag)
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
