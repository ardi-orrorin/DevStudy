//
//  FuritCardView.swift
//  Fructus
//
//  Created by 유승철 on 1/20/24.
//

import SwiftUI

struct FuritCardView: View {
    // MARK: Properties
    
    var fruit: Fruit
    
    @State private var isAnimating: Bool = false
    
    // MARK: BODY
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                // FRUIT: IMAGE
                Image(fruit.image)
                    .resizable()
                    .scaledToFit()
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                    .scaleEffect(isAnimating ? 1 : 0.6)
                
                // FRUIT: TITLE
                
                Text(fruit.title)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 2, x: 2, y: 2)
                
                // FRUIT: HEADLINE
                Text(fruit.headline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: 480)
                
                // BUTTON: START
                StartButtonView()
                
            }//: VSTACK
        }//: ZSTACK
        .onAppear {
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimating = true
            }
        }
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(
            LinearGradient(
                gradient: Gradient(
                    colors: fruit.gradientColors),
                    startPoint: .top,
                    endPoint: .bottom
            )
            
        )
        .cornerRadius(20)
        .padding(.horizontal, 20)
    }
        
}



// MARK: Preview
#Preview {
    FuritCardView(fruit: fruitsData[1])
}
