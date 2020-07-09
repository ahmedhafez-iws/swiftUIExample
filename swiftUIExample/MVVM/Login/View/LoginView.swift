//
//  LoginView.swift
//  swiftUIExample
//
//  Created by user174699 on 7/9/20.
//  Copyright © 2020 user174699. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    var viewModel: LoginViewModel
    @Binding var moveToNextScreen: Bool
    
    var body: some View {
        Button(action: {
            self.viewModel.tryToLogin {
                withAnimation {
                    self.moveToNextScreen.toggle()
                }
            }
            }, label: {
                Text("Log in")
                .foregroundColor(Color.white)
                .font(.title)
            })
            .frame(width: 200, height: 70)
            .background(Color("primary_color"))
            .cornerRadius(10)
            .navigationBarTitle("Login")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel(), moveToNextScreen: .constant(false))
    }
}
