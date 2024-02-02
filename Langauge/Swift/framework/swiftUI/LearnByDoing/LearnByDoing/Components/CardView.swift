//
//  CardView.swift
//  LearnByDoing
//
//  Created by 유승철 on 2/2/24.
//

import SwiftUI

struct CardView: View {
    
    // MARK: - properties
    var card: Card
    
    // MARK: - body
    
    var body: some View {
        ZStack {
            Image(card.imageName)
            
            VStack {
                Text(card.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Text(card.headline)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .italic()
                Spacer()
                
                Button {
                    
                } label: {
                    HStack {
                        Text("Learn".uppercased())
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .accentColor(.white)
                        
                        Image(systemName: "arrow.right.circle")
                            .font(.title.weight(.medium))
                            .accentColor(.white)
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 25)
                    .background(
                        LinearGradient(
                            colors: card.gradientColors,
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .clipShape(Capsule())
                    .shadow(
                        color: Color("ColorShadow"),
                        radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/,
                        x: 0, y: 3
                    )
                    
                }
            }
            .padding(.top, 20)
            .padding(.bottom, 25)
            
        }
        .frame(width: 335, height: 545)
        .background(
            Gradient(colors: card.gradientColors)
        )
        .cornerRadius(16)
        .shadow(radius: 8)
    }
}

#Preview {
    CardView(card: cardData[1])
}
