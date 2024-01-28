//
//  ProductItemView.swift
//  TouchDown
//
//  Created by 유승철 on 1/27/24.
//

import SwiftUI

struct ProductItemView: View {
    
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            ZStack {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .padding(10)
            }//: ZStack
            .background(Color(red: product.red, green: product.green, blue: product.blue)
            )
            .cornerRadius(12)
            
            Text(product.name)
                .font(.title3)
                .fontWeight(.black)
            
            Text("$\(product.price)")
                .fontWeight(.semibold)
                .foregroundColor(.gray)
            
        }//:Vstack
    }
}

#Preview {
    ProductItemView(product: products[0])
}
