//
//  FruitNutrientsView.swift
//  Fructus
//
//  Created by 유승철 on 1/21/24.
//

import SwiftUI

struct FruitNutrientsView: View {
    
    // MARK: - PROPERTIES
    
    var fruit: Fruit
    let nutrients: [String] = ["Energy", "Sugar", "Fat", "Protein", "Vitamins", "Minerals"]
    // MARK: - BODY
    
    var body: some View {
        GroupBox() {
            DisclosureGroup("Nutritional value per 100g") {
                ForEach(0..<nutrients.count, id: \.self) { item in
                    Divider().padding(.vertical, 2)
                    
                    HStack {
                        Group {
                            Image(systemName: "info.circle")
                            Text(nutrients[item])
                        }
                        .foregroundColor(fruit.gradientColors[1])
                        .font(.system(.body).bold())
                        
                        Spacer(minLength: 25)
                        
                        Text(fruit.nutrition[item])
                            .multilineTextAlignment(.trailing)
                    } //: HSTACK
                }// : LOOP
                
            }
        } //: BOX
    
    }
}

#Preview {
    FruitNutrientsView(fruit: fruitsData[0])
//        .padding(.horizontal, 20)
}
