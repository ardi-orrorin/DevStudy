//
//  RecipeCardView.swift
//  Avocado
//
//  Created by 유승철 on 2/5/24.
//

import SwiftUI

struct RecipeCardView: View {
    
    var recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Image(recipe.image)
                .resizable()
                .scaledToFit()
                .overlay {
                    HStack {
                        Spacer()
                        VStack {
                            Image(systemName: "bookmark")
                                .font(.title.weight(.light))
                                .foregroundColor(.white)
                                .imageScale(.small)
                                .shadow(
                                    color: Color("ColorBlackTransparentLight"),
                                    radius: 2,
                                    x: 0, y: 0
                                )
                                .padding(.trailing, 20)
                                .padding(.top, 20)
                            Spacer()
                        }//: vstack
                    }//: hstacl
                }//: overlay
            
            VStack(alignment: .leading, spacing: 12) {
                // title
                Text(recipe.title)
                    .font(.system(.title, design: .serif))
                    .fontWeight(.bold)
                    .foregroundColor(Color("ColorGreenMedium"))
                    .lineLimit(1)
                
                // headline
                Text(recipe.headline)
                    .font(.system(.body, design: .serif))
                    .foregroundColor(.gray)
                    .italic()
                
                // rates
                RecipeRatingView(recipe: recipe)
                
                // cooking
                RecipeCookingView(recipe: recipe)
                
                
            }//: vstack
            .padding()
            .padding(.bottom, 12)
            
        }//: vstack
        .background(.white)
        .cornerRadius(12)
        .shadow(
            color: Color("ColorBlackTransparentLight"),
            radius: 8,
            x: 0, y: 0
        )
        
        
    }
}

#Preview {
    RecipeCardView(recipe: recipesData[0])
}
