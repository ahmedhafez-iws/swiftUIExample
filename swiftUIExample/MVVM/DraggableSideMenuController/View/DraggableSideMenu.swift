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
    
    let maxOffset: CGFloat = 450
    let offsetRatio: CGFloat = 2/3
    
    init(viewModel: MainViewViewModel) {
        self.viewModel = viewModel
        sideMenuContentViewModel = self.viewModel.getViewModelForSideMenuContentView()
    }
    
    var body: some View {
        
        let closeDrag = DragGesture()
            .onChanged { drag in
                if self.showMenu {
                    print("HAFEZ \(drag.translation.width)")
                    self.offset = max(0, min(self.offset + (drag.translation.width * 0.2), UIScreen.main.bounds.width * 0.8))
                }
        }
        .onEnded { drag in
            if self.showMenu {
                if self.offset < 200 {
                    withAnimation {
                        self.offset = 0
                        self.showMenu = false
                    }
                }
                else {
                    withAnimation {
                        self.offset = min(UIScreen.main.bounds.width * self.offsetRatio, self.maxOffset)
                    }
                }
            }
        }
        
        
        return GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Color((self.showMenu ? UIColor(named: "primary_color") : UIColor.clear) ?? UIColor.white)
                    .edgesIgnoringSafeArea(.all)
                
                MenuView(closeMenuClosure: {
                    withAnimation {
                        self.offset = 0
                        self.showMenu = false
                    }
                })
                    .frame(width: min(geometry.size.width * self.offsetRatio, self.maxOffset))
                    .transition(.move(edge: .leading))
                    .transition(.opacity)
                    .scaleEffect(self.showMenu ? 1.0 : 2)
                
                ZStack {
                    GeometryReader { gem in
                        ZStack {
                            ShadowView().frame(width: gem.size.width, height: gem.size.height - 100)
                                .background(Color.white)
                                .cornerRadius(7)
                                .opacity(0.6)
                            
                            ShadowView().frame(width: gem.size.width - 30, height: gem.size.height - 50)
                                .background(Color.white)
                                .cornerRadius(7)
                                .opacity(0.6)
                            
                            SideMenuContentView(viewModel: self.sideMenuContentViewModel, openMenuClosure: {
                                withAnimation {
                                    self.offset = min(geometry.size.width * self.offsetRatio, self.maxOffset)
                                    self.showMenu = true
                                }
                            })
                                .disabled(self.showMenu ? true : false)
                                .cornerRadius(self.showMenu ? 10 : 0)
                                .offset(x: self.showMenu ? 30 : 0)
                            
                            if self.showMenu {
                                VStack{
                                    Spacer()
                                }
                                .contentShape(Rectangle())
                                .frame(width: gem.size.width, height: gem.size.height)
                            }
                        }
                    }
                }
                .frame(width: geometry.size.width, height: self.showMenu ? geometry.size.height - 100 : geometry.size.height)
                .disabled(self.showMenu ? true : false)
                .offset(x: self.showMenu ? self.offset - 30 : self.offset)
                .clipped()
                .gesture(self.showMenu ? TapGesture().onEnded({
                    withAnimation {
                        self.offset = 0
                        self.showMenu = false
                    }
                }) : nil)
            }
            .gesture(closeDrag)
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
