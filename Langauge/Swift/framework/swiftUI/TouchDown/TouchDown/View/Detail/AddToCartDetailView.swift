//
//  AddToCartDetailView.swift
//  TouchDown
//
//  Created by 유승철 on 1/28/24.
//

import SwiftUI

struct AddToCartDetailView: View {
    
    @EnvironmentObject var shop: Shop
    
    var body: some View {
        Button {
            
        } label: {
            Spacer()
            Text("Add to cart".uppercased())
                .font(.system(.title2, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.white)
            Spacer()
        }
        .padding(15)
        .background(
            Color(
                Color(
                    red: shop.selectProduct?.red ?? sampleProduct.red,
                    green: shop.selectProduct?.green ?? sampleProduct.green,
                    blue: shop.selectProduct?.blue ?? sampleProduct.blue
                )
            )
        )
        .clipShape(Capsule())
    }
}

#Preview {
    AddToCartDetailView()
        .background(Color.gray)
        .environmentObject(Shop())
}
