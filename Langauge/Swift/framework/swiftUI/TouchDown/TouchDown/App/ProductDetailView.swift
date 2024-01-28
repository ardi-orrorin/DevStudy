//
//  ProductDetailView.swift
//  TouchDown
//
//  Created by 유승철 on 1/28/24.
//

import SwiftUI

struct ProductDetailView: View {
    
    @EnvironmentObject var shop: Shop
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            // Navbar
            NavigatioBarDetailView()
                .padding(.horizontal)
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top
                )
                
            
            // Header
            HeaderDetailView()
                .padding(.horizontal)
                
            
            // detail top start
            TopPartDetailview()
                .padding(.horizontal)
                .zIndex(2)
            
            // detail bottom part
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0) {
                
                // ratings + sizes
                RatingsSizedDetailView()
                    .padding(.top, -20)
                    .padding(.bottom, 10)
                
                // description
                ScrollView(.vertical, showsIndicators: false) {
                    Text(shop.selectProduct?.description
                         ?? sampleProduct.description)
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                } //: scroll
            
                
                // quanntity + favorite
                QuantityFavoritesDetailView()
                    .padding(.vertical, 15)
                
                // add to cart
                AddToCartDetailView()
                    .padding(.bottom, 20)
                
                Spacer()
            }//: Vstack
            .padding(.horizontal)
            .background(
                Color.white
                    .clipShape(CustomShape())
                    .padding(.top, -105)
            )
            
            
        }//: Vstack
        .zIndex(0)
        .ignoresSafeArea(.all, edges: .all)
        .background(
            Color(
                red: shop.selectProduct?.red ?? sampleProduct.red,
                green: shop.selectProduct?.green ?? sampleProduct.green,
                blue: shop.selectProduct?.blue ?? sampleProduct.blue
            ).ignoresSafeArea(.all, edges: .all)
            
        )
    }
}

#Preview {
    ProductDetailView()
        .environmentObject(Shop())
}
