//
//  MenuView.swift
//  swiftUIExample
//
//  Created by user174699 on 7/9/20.
//  Copyright © 2020 user174699. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Image("ic_close_side_menu")
            .onTapGesture {
                withAnimation {
                    self.showMenu = false
                }
            }
            .padding(.top, 50)
            .padding(.bottom, -50)
            
            Spacer()
            
            HStack {
                Image(systemName: "person")
                    .imageScale(.large)
                Text("Profile")
                    .font(.headline)
            }
            HStack {
                Image(systemName: "envelope")
                    .imageScale(.large)
                Text("Messages")
                    .font(.headline)
            }
            .padding(.top, 30)
            HStack {
                Image(systemName: "gear")
                    .imageScale(.large)
                Text("Settings")
                    .font(.headline)
            }
            .padding(.top, 30)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.clear)
        .foregroundColor(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(showMenu: .constant(false))
    }
}
