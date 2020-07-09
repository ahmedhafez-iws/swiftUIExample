//
//  DetailView.swift
//  swiftUIExample
//
//  Created by user174699 on 7/8/20.
//  Copyright © 2020 user174699. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    var body: some View {
        ZStack {
            Color(UIColor(named: "grey_background_color") ?? UIColor.gray)
            .edgesIgnoringSafeArea(.bottom)
            
            
            ScrollView {
                VStack(spacing: 20.0) {
                    CollapseView()
                    
                    CollapseView()
                    
                    Spacer()
                }
            }
            .padding(.top)
        }
        .navigationBarTitle("Detail Screen", displayMode: .inline)
    }
}

struct CollapseView: View {
    
    @State var isCollapsed = true
    
    var body: some View {
        VStack(spacing: 0.0) {
            
            HStack {
                Image("ic_medicine")
                Text("Section Name")
                    .foregroundColor(Color("accent_color"))
                Spacer()
                Image("ic_expand")
                    .rotationEffect(Angle.degrees(isCollapsed ? 0: 180))
                    .animation(Animation.linear)
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(Color.white)
            .onTapGesture {
                withAnimation {
                    self.isCollapsed.toggle()
                }
            }
            
            VStack(spacing: 20.0) {
                SectionCell(isCollapsed: $isCollapsed)
                    .foregroundColor(Color.red)
                
                SectionCell(isCollapsed: $isCollapsed)
                    .foregroundColor(Color.blue)
            }
            .padding(.all)
            .frame(maxHeight: isCollapsed ? 0 : .infinity)
            .frame(maxWidth: .infinity)
            .background(Color("dark_grey_background_color"))
            .clipped()
            
        }
    }
}

struct SectionCell: View {
    
    @Binding var isCollapsed: Bool
    
    var body: some View {
        VStack(spacing: 16.0) {
            HStack {
                Text("label")
                Spacer()
                Text("Value")
            }
            .frame(maxHeight: isCollapsed ? 0 : .infinity)
            .padding(.horizontal)
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color("dark_grey_background_color"))
                .frame(maxHeight: isCollapsed ? 0 : .infinity)
            HStack {
                Text("label")
                Spacer()
                Text("Value")
            }
            .frame(maxHeight: isCollapsed ? 0 : .infinity)
            .padding(.horizontal)
            Rectangle()
            .frame(height: 1)
            .foregroundColor(Color("dark_grey_background_color"))
            .frame(maxHeight: isCollapsed ? 0 : .infinity)
            HStack {
                Text("label")
                Spacer()
                Text("Value")
            }
            .frame(maxHeight: isCollapsed ? 0 : .infinity)
            .padding(.horizontal)
        }
        .padding(.vertical)
        .frame(maxHeight: isCollapsed ? 0 : .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .clipped()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
