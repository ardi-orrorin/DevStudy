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
                HStack(alignment: .center, spacing: 5) {
                    ForEach(1...(recipe.rating), id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .font(.body)
                            .foregroundColor(.yellow)
                    }
                }//: hstack
                
                // cooking
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 12) {
                    HStack(alignment: .center, spacing: 2) {
                        Image(systemName: "person.2")
                        Text("Serves: \(recipe.serves)")
                    }
                    
                    HStack(alignment: .center, spacing: 2) {
                        Image(systemName: "clock")
                        Text("Prep: \(recipe.preparation)")
                    }
                    
                    HStack(alignment: .center, spacing: 2) {
                        Image(systemName: "flame")
                        Text("Cooking: \(recipe.cooking)")
                    }
                }//: hstack
                .font(.footnote)
                .foregroundColor(.gray)
                
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
