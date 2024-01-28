//
//  HeaderDetailView.swift
//  TouchDown
//
//  Created by 유승철 on 1/28/24.
//

import SwiftUI

struct HeaderDetailView: View {
    
    @EnvironmentObject var shop: Shop
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6){
            Text("Protective Gear")
            
            Text(shop.selectProduct?.name ?? sampleProduct.name)
                .font(.largeTitle)
                .fontWeight(.black)
        }//: Vstack
        .foregroundColor(.white)
    }
}

#Preview {
    HeaderDetailView()
        .environmentObject(Shop())
        .previewLayout(.sizeThatFits)
        .padding()
        .background(Color.gray)
}
