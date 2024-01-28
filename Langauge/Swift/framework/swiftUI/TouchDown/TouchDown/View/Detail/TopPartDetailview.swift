//
//  TopPartDetailview.swift
//  TouchDown
//
//  Created by 유승철 on 1/28/24.
//

import SwiftUI

struct TopPartDetailview: View {
    
    @State private var isAnimation: Bool = false
    @EnvironmentObject var shop: Shop
    
    
    var body: some View {
        HStack(alignment: .center, spacing: 6) {
            VStack(alignment: .leading, spacing: 6) {
                Text("Price")
                    .fontWeight(.semibold)
                
                Text(shop.selectProduct?.formattedPrice
                     ?? sampleProduct.formattedPrice)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .scaleEffect(1.35, anchor: .leading)
            } //: Vstack
            .offset(y: isAnimation ? -50 : -75)
            
            Spacer()
            
            Image(shop.selectProduct?.image ??
                  sampleProduct.image)
                .resizable()
                .scaledToFit()
                .offset(y: isAnimation ? 8 : -35)
        }// HStack
        .onAppear(perform: {
            withAnimation(.easeOut(duration: 0.75)) {
                isAnimation.toggle()
            }
        })
    }
}

#Preview {
    TopPartDetailview()
        .environmentObject(Shop())
}
