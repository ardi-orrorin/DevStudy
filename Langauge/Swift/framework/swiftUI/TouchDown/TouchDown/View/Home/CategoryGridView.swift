//
//  CategoryGridView.swift
//  TouchDown
//
//  Created by 유승철 on 1/27/24.
//

import SwiftUI

struct CategoryGridView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: girdLayout, alignment: .center, spacing: columnSpacing, pinnedViews: []) {
                Section(
                    header: SectionView(rotateClockWise: false),
                    footer: SectionView(rotateClockWise: true)
                ) {
                    ForEach(categories) { category in
                        CategoryItemView(category: category)
                    }
                }
            }//: LazyHGrid
            .frame(height: 140)
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
        }// ScrollView
    }
}

#Preview {
    CategoryGridView()
}
