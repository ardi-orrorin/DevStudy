//
//  BrandGridView.swift
//  TouchDown
//
//  Created by 유승철 on 1/28/24.
//

import SwiftUI

struct BrandGridView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: gridLayout, spacing: columnSpacing) {
                ForEach(brands) { brand in
                    BrandItemView(brand: brand)
                }//: Loop
            }//: Grid
            .frame(height: 200)
            .padding(15)
        }//: Scrollview
        
    }
}

#Preview {
    BrandGridView()
}
