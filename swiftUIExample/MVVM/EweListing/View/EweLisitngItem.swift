//
//  EweLisitngItem.swift
//  swiftUIExample
//
//  Created by user174699 on 7/9/20.
//  Copyright © 2020 user174699. All rights reserved.
//

import SwiftUI

struct EweListingItem: View {
    
    var viewModel: EweListingItemViewModel
    
    var body: some View {
        HStack(spacing: 10.0) {
            Image(viewModel.thumbnailPlaceholder)
                .clipped()
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(viewModel.eweId)
                    .foregroundColor(Color("primary_color"))
                    .font(.system(size: 20))
                if viewModel.isBirthExist {
                    HStack {
                        Image(viewModel.deliveryTypeIcon)
                        Text(viewModel.birthDate)
                        .lineLimit(1)
                    }
                }
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                if viewModel.isStationExixst {
                    HStack {
                        Text(viewModel.station)
                            .lineLimit(1)
                        Image("ic_location")
                    }
                }
                
                HStack {
                    Text(viewModel.eweGender)
                    Image(viewModel.genderIcon)
                }
            }
        }
        .padding(.all)
        .font(.footnote)
        .foregroundColor(Color("grey_text_color"))
        .background(Color.white)
        .cornerRadius(10)
    }
}


struct EweLisitngItem_Previews: PreviewProvider {
    static var previews: some View {
        EweListingItem(viewModel: EweListingItemViewModel(EweInfo(id: "code00", gender: "ذكر")))
    }
}
