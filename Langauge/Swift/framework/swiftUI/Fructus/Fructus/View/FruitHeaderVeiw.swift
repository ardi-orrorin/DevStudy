//
//  FruitHeaderVeiw.swift
//  Fructus
//
//  Created by 유승철 on 1/21/24.
//

import SwiftUI

struct FruitHeaderVeiw: View {
    
    // MARK: - PROPERTIES
    var fruit: Fruit
    @State private var isAnimmatingImage: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: fruit.gradientColors),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            
            Image(fruit.image)
                .resizable()
                .scaledToFit()
                .shadow(
                    color: Color(
                        red: 0,
                        green: 0,
                        blue: 0,
                        opacity: 0.15
                    ),
                    radius: 8,
                    x: 6,
                    y: 8
                )
                .padding(.vertical, 20)
                .scaleEffect(isAnimmatingImage ? 1 : 0.6 )
        }
        .frame(height: 440)
        .onAppear() {
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimmatingImage = true
            }
        }
    }
}

#Preview {
    FruitHeaderVeiw(fruit: fruitsData[0])
}
