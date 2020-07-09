//
//  ContentView.swift
//  swiftUIExample
//
//  Created by user174699 on 7/8/20.
//  Copyright © 2020 user174699. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var moveToNextScreen = false
    var viewModel: ManagementViewModel
    
    var body: some View {
        ZStack {
            NavigationView {
                ZStack {
                    Color(UIColor(named: "grey_background_color") ?? UIColor.gray)
                    .edgesIgnoringSafeArea(.bottom)
                    VStack(alignment: .center, spacing: 30.0) {
                        NavigationLink(destination: LoginView(viewModel: viewModel.getViewModelForLoginView(step: 0), moveToNextScreen: $moveToNextScreen)) {
                            ManagementButton(imageName: "ic_management_cattle", title: "Cattle Management")
                        }

                        NavigationLink(destination: LoginView(viewModel: viewModel.getViewModelForLoginView(step: 1), moveToNextScreen: $moveToNextScreen)) {
                            ManagementButton(imageName: "ic_management_ewe", title: "Ewe Management")
                        }
                        
                        Spacer()
                    }
                    .padding(.top, 40.0)
                }
                .navigationBarTitle("Management Screen", displayMode: .inline)
                .background(NavigationConfigurator { nc in
                    // do any specifi customization for this navigation bar only
                })
            }
            .navigationViewStyle(StackNavigationViewStyle())
            
            if moveToNextScreen {
                MainView(viewModel: viewModel.getViewModelForMainView())
                .transition(.move(edge: .trailing))
            }
        }
    }
}

struct ManagementButton: View {
    
    var imageName: String
    var title: String
    
    var body: some View {
        HStack {
            Spacer(minLength: 20)
            
            VStack() {
                Spacer(minLength: 50)
                Image(imageName)
                    .renderingMode(.original)
                Spacer()
                Text(title)
                .foregroundColor(Color("accent_color"))
                Spacer(minLength: 30)
            }
            .frame(maxWidth: 600)
            .frame(height: 180, alignment: .center)
            .background(Color.white)
            .cornerRadius(10)
            
            Spacer(minLength: 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ManagementViewModel())
    }
}

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            nc.navigationBar.barTintColor = .white
            nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor(named: "primary_color")!, .font : UIFont(name: "HelveticaNeue-Thin", size: 20)!]
            self.configure(nc)
        }
    }

}
