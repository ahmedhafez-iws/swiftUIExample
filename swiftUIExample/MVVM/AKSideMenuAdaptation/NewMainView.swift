//
//  NewMainView.swift
//  swiftUIExample
//
//  Created by user174699 on 7/21/20.
//  Copyright © 2020 user174699. All rights reserved.
//

import SwiftUI

struct NewMainView: View {
    
    var openMenuClosure: () -> Void
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.yellow)
                .edgesIgnoringSafeArea(.all)
                
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            .navigationBarTitle("Side Menu", displayMode: .inline)
            .background(NavigationConfigurator { nc in
                // do any specifi customization for this navigation bar only
            })
            .navigationBarItems(leading: Button(action: {
                self.openMenuClosure()
            }, label: {
                Image("ic_show_side_menu")
            }))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct NewMainView_Previews: PreviewProvider {
    static var previews: some View {
        NewMainView(openMenuClosure: {
            
        })
    }
}
