//
//  CategoryItemView.swift
//  TouchDown
//
//  Created by 유승철 on 1/27/24.
//

import SwiftUI

struct CategoryItemView: View {
    
    // MARK: - properties
    let category: Categroy
    
    
    // MARK: - body
    
    var body: some View {
        Button {
            
            
        } label: {
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 6) {
                Image(category.image)
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30, alignment: .center)
                    .foregroundColor(.gray)
                              
                Text(category.name.uppercased())
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                
                Spacer()
            }// HStack
            .padding()
            .background(Color.white.cornerRadius(12))
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.gray, lineWidth: 1)
            )
        }//: button
    }
}


// MARK: - prewview
#Preview {
    CategoryItemView(category: categories[0])
        .background(COLOR_BACKGROUND)
}
