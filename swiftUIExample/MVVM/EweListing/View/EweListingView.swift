//
//  EweListingView.swift
//  swiftUIExample
//
//  Created by user174699 on 7/8/20.
//  Copyright © 2020 user174699. All rights reserved.
//

import SwiftUI
import SwiftUIRefresh

struct EweListingView: View {
    
    @ObservedObject var viewModel: EweListingViewModel
    @State private var codeFilter = ""
    @State private var shouldAnimate = true
    @State private var showingRefreshIndicator = false
    @Binding var showMenu: Bool
    
    init(viewModel: EweListingViewModel, showMenu: Binding<Bool>) {
        self.viewModel = viewModel
        self._showMenu = showMenu
    }
    
    func delete(at offsets: IndexSet) {
        for index in offsets {
            print("HAFEZ delete \(viewModel.data[index].id)")
        }
    }
    
    private func onMove(source: IndexSet, destination: Int) {
        viewModel.data.move(fromOffsets: source, toOffset: destination)
    }
    
    var body: some View {
        
        
        NavigationView {
            ZStack {
                Color(UIColor(named: "grey_background_color") ?? UIColor.gray)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    TopView(codeFilter: $codeFilter)
                        .padding(.top, 20.0)
                    
                    if viewModel.showPrimaryLoader {
                        Spacer()
                        ActivityIndicator(isAnimating: $shouldAnimate, style: .large, color: UIColor(named: "accent_color"))
                        Spacer()
                    }
                    else if viewModel.isError {
                        Spacer()
                        Text("OOPS, Something went wrong!")
                            .foregroundColor(Color.red)
                            .font(.headline)
                        Spacer()
                    }
                    else {
                        List {
                            ForEach(viewModel.data, id: \.id) { item in
                                //                            NavigationLink(destination: DetailView()) {
                                //                                EweListingItem(viewModel: self.viewModel.getViewModelFor(item))
                                //                                    // 20 padding trainling from the edge of screen
                                //                                    .padding(.trailing, 20.0)
                                //                                    .onAppear {
                                //                                        self.viewModel.onItemAppear(item)
                                //                                }
                                //                            }
                                //                                // -32 padding trailing to hide the arrow of the navigation link the list item will be at the edge of screen
                                //                            .padding(.trailing, -32)
                                //                            .buttonStyle(PlainButtonStyle())
                                
                                
                                
                                ZStack {
                                    NavigationLink(destination: DetailView()) {
                                        EmptyView()
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                    .frame(width: 0)
                                    
                                    EweListingItem(viewModel: self.viewModel.getViewModelFor(item))
                                        .onAppear {
                                            self.viewModel.onItemAppear(item)
                                    }
                                }
                            }
                            .onDelete(perform: delete)
                            //                        .onMove(perform: onMove)
                            
                            if viewModel.showLoaderCell {
                                HStack {
                                    ActivityIndicator(isAnimating: $shouldAnimate, style: .medium, color: UIColor.gray)
                                }
                                .frame(maxWidth: .infinity)
                            }
                        }
                        .background(Color.clear)
                        .pullToRefresh(isShowing: $showingRefreshIndicator) {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                self.showingRefreshIndicator = false
                                self.viewModel.clearData()
                                self.viewModel.fetchData()
                            }
                        }
                    }
                }
                .navigationBarTitle("Main Screen", displayMode: .inline)
                .navigationBarItems(leading: Button(action: {
                    withAnimation {
                        self.showMenu = true
                    }
                }, label: {
                    Image("ic_show_side_menu")
                }), trailing: EditButton())
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {
            self.viewModel.fetchData()
        }
    }
}

struct TopView: View {
    
    @Binding var codeFilter: String
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                TextField("Search by code", text: self.$codeFilter)
                    .padding(.leading)
                    .frame(maxHeight: .infinity)
                    .background(Color.white)
                    .font(.subheadline)
                    .cornerRadius(5)

                NavigationLink(destination: DetailView()) {
                    HStack {
                        Image("ic_search_options")
                            .renderingMode(.original)
                        Text("Search options")
                            .foregroundColor(Color.white)
                            .font(.footnote)
                        Spacer()
                    }
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .background(Color("primary_color"))
                .frame(width: geometry.size.width * 0.45)
                .cornerRadius(5)
            }
        }
        .frame(height: 40)
        .padding(.horizontal, 20.0)
        .clipped()
    }
}

struct EweListingView_Previews: PreviewProvider {
    static var previews: some View {
        EweListingView(viewModel: EweListingViewModel(), showMenu: .constant(false))
    }
}


