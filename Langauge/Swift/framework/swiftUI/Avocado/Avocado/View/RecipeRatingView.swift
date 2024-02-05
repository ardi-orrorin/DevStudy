//
//  RecipeRatingView.swift
//  Avocado
//
//  Created by 유승철 on 2/5/24.
//

import SwiftUI

struct RecipeRatingView: View {
    
    var recipe: Recipe
    
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            ForEach(1...(recipe.rating), id: \.self) { _ in
                Image(systemName: "star.fill")
                    .font(.body)
                    .foregroundColor(.yellow)
            }
        }//: hstack
    }
}

#Preview {
    RecipeRatingView(recipe: recipesData[0])
}
