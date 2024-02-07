//
//  RecipeCookingView.swift
//  Avocado
//
//  Created by 유승철 on 2/5/24.
//

import SwiftUI

struct RecipeCookingView: View {
    
    var recipe: Recipe
    
    var body: some View {
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
        
    }
}

#Preview {
    RecipeCookingView(recipe: recipesData[0])
}
