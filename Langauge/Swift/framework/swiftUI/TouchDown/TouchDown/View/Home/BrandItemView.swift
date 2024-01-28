//
//  BrandItemView.swift
//  TouchDown
//
//  Created by 유승철 on 1/28/24.
//

import SwiftUI

struct BrandItemView: View {
    
    let brand: Brand
    
    var body: some View {
        Image(brand.image)
            .resizable()
            .scaledToFit()
            .padding()
            .background(Color.white.cornerRadius(12))
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray, lineWidth: 1)
            
            )
    }
}

#Preview {
    BrandItemView(brand: brands[0])
}
