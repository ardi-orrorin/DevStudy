//
//  CardView.swift
//  Honeymoon
//
//  Created by 유승철 on 2/9/24.
//

import SwiftUI

struct CardView: View {
    
    // MARK: - properties
    let id = UUID()
    
    var honeymoon: Destination
    
    
    var body: some View {
        Image(honeymoon.image)
            .resizable()
            .cornerRadius(24)
            .scaledToFit()
            .frame(minWidth: 0, maxWidth: .infinity)
            .overlay (
                introduce()
                , alignment: .bottom
            )
    }
    
    func introduce() -> some View {
        VStack {
            Text(honeymoon.place.uppercased())
                .foregroundStyle(.white)
                .font(.largeTitle)
                .fontWeight(.bold)
                .shadow(radius: 1)
                .padding(.horizontal, 18)
                .padding(.vertical, 4)
                .overlay(
                    Rectangle()
                        .fill(.white)
                        .frame(height: 1)
                    ,alignment: .bottom
                )
            
            Text(honeymoon.country.uppercased())
                .foregroundStyle(.black)
                .font(.footnote)
                .fontWeight(.bold)
                .frame(minWidth: 85)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(
                    Capsule().fill(.white)
                )
            
            
        }
        .frame(minWidth: 200)
        .padding(.bottom, 50)
    }
}

#Preview {
    CardView(honeymoon: honeymoonData[1])
}
