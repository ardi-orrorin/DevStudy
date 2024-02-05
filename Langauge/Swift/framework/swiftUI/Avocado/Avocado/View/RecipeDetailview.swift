//
//  RecipeDetailview.swift
//  Avocado
//
//  Created by 유승철 on 2/5/24.
//

import SwiftUI

struct RecipeDetailview: View {
    
    var recipe: Recipe
    
    
    @State private var pulsate: Bool = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 0) {
                // image
                Image(recipe.image)
                    .resizable()
                    .scaledToFit()
                
                Group {
                    // title
                    Text(recipe.title)
                        .font(.system(.largeTitle, design: .serif))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("ColorGreenAdaptive"))
                        .padding(.top, 10)
                    
                    // rating
                    RecipeRatingView(recipe: recipe)
                    
                    // cooking
                    RecipeCookingView(recipe: recipe)
                    
                    // ingredient
                    Text("Ingredients")
                        .fontWeight(.bold)
                        .modifier(TitleModifier())
                    
                    VStack(alignment: .leading, spacing: 5) {
                        ForEach(recipe.ingredients, id: \.self) { item in
                            VStack(alignment: .leading, spacing: 5) {
                                Text(item)
                                    .font(.footnote)
                                    .multilineTextAlignment(.leading)
                                Divider()
                            }//: vstack
                        }//: loop
                    }//: vstack
                    
                    // instruction
                    Text("Instructions")
                        .fontWeight(.bold)
                        .modifier(TitleModifier())
                    
                    ForEach(recipe.ingredients, id: \.self) { item in
                        VStack(alignment: .center, spacing: 5) {
                            Image(systemName: "chevron.down.circle")
                                .resizable()
                                .frame(width: 42, height: 42, alignment: .center)
                                .imageScale(.large)
                                .font(.title.weight(.ultraLight))
                                .foregroundColor(Color("ColorGreenAdaptive"))
                            
                            Text(item)
                                .lineLimit(nil)
                                .multilineTextAlignment(.center)
                                .font(.system(.body, design: .serif))
                                .frame(minHeight: 100)
                        }//: vstack
                    }//: loop
                }//: group
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
            }//: vstack
        }//: scrollview
        .edgesIgnoringSafeArea(.all)
        .overlay {
            HStack {
                Spacer()
                
                VStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "chevron.down.circle.fill")
                            .font(.title)
                            .foregroundColor(.white)
                            .shadow(radius: 4)
                            .opacity(pulsate ? 1 : 0.6)
                            .scaleEffect(pulsate ? 1.2 : 0.8)
                    }//: button
                    .padding(.trailing, 20)
                    .padding(.top, 24)
                    Spacer()
                }//: vstack
            }//: hstack
        }//: overlay
        .onAppear() {
            withAnimation(
                .easeInOut(duration: 1.5)
                .repeatForever()
            ) {
                pulsate.toggle()
            }
            
        }
    }
}

#Preview {
    RecipeDetailview(recipe: recipesData[0])
}
