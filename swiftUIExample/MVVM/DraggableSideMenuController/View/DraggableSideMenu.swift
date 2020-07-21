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
    @State var heightOffset: CGFloat = 0
    @State var scale: CGFloat = 2
    let sideMenuContentViewModel: SideMenuContentViewModel
    
    let maxOffset: CGFloat = 450
    let offsetRatio: CGFloat = 2/3
    
    init(viewModel: MainViewViewModel) {
        self.viewModel = viewModel
        sideMenuContentViewModel = self.viewModel.getViewModelForSideMenuContentView()
    }
    
    var body: some View {
        
        var lastDragWidth: CGFloat = 0
        
        let closeDrag = DragGesture()
            .onChanged { drag in
                if self.showMenu {
                    self.offset = max(0, min(self.offset + ((drag.translation.width - lastDragWidth) * 0.1), UIScreen.main.bounds.width * 0.8))
                    
                    if self.offset < UIScreen.main.bounds.width * 0.8 {
                        
                        self.heightOffset = max(0, min(140, self.heightOffset + ((drag.translation.width - lastDragWidth) * 0.05)))
                        
                        self.scale = max(1, min(2, self.scale - (drag.translation.width - lastDragWidth) * (drag.translation.width > 0 ? 0.0005 : 0.0001)))
                    }
                    
                    lastDragWidth = drag.translation.width
                }
                else if drag.startLocation.x < 3 {
                    withAnimation {
                        self.showMenu = true
                    }
                }
        }
        .onEnded { drag in
            lastDragWidth = 0
            if self.showMenu {
                if self.offset < (drag.translation.width > 0 ? 50 : 200) {
                    withAnimation {
                        self.offset = 0
                        self.showMenu = false
                        self.heightOffset = 0
                        self.scale = 2
                    }
                }
                else {
                    withAnimation {
                        self.showMenu = true
                        self.offset = min(UIScreen.main.bounds.width * self.offsetRatio, self.maxOffset)
                        self.heightOffset = 100
                        self.scale = 1
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
                        self.scale = 2
                        self.heightOffset = 0
                    }
                })
                    .frame(width: min(geometry.size.width * self.offsetRatio, self.maxOffset))
//                    .transition(.move(edge: .leading))
                    .scaleEffect(self.scale)
                
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
                                    self.heightOffset = 100
                                    self.scale = 1
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
                .frame(width: geometry.size.width, height: geometry.size.height - self.heightOffset)
                .disabled(self.showMenu ? true : false)
//                .offset(x: self.showMenu ? self.offset - 30 : self.offset, y: self.heightOffset / 2)
                .offset(x: self.showMenu ? self.offset - 30 : self.offset)
                .clipped()
                .gesture(self.showMenu ? TapGesture().onEnded({
                    withAnimation {
                        self.offset = 0
                        self.showMenu = false
                        self.heightOffset = 0
                        self.scale = 2
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
