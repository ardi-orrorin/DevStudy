//
//  QuantityFavoritesDetailView.swift
//  TouchDown
//
//  Created by 유승철 on 1/28/24.
//

import SwiftUI

struct QuantityFavoritesDetailView: View {
    
    @State private var counter: Int = 0
    
    var body: some View {
        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 6){
            Button {
                if counter > 0 {
                    counter -= 1
                }
                
            } label: {
                Image(systemName: "minus.circle")
            }
            
            Text("\(counter)")
                .frame(minWidth: 36)
            
            Button {
                if counter < 100 {
                    counter += 1
                }
            } label: {
                Image(systemName: "plus.circle")
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "heart.circle")
                    .foregroundColor(.pink)
            }
        }
        .font(.system(.title, design: .rounded))
        .foregroundColor(.black)
        .imageScale(.large)
    }
}

#Preview {
    QuantityFavoritesDetailView()
}
