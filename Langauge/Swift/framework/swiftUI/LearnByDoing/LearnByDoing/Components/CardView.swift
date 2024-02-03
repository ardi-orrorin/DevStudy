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
    
    var hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var fadeIn: Bool = false
    @State private var moveDownard: Bool = false
    @State private var moveUpward: Bool = false
    @State private var showAlert: Bool = false
    
    
    // MARK: - body
    
    var body: some View {
        ZStack {
            Image(card.imageName)
                .opacity(fadeIn ? 1.0 : 0.0)
            
            VStack {
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
                }
                .offset(y: moveDownard ? 0 : -80)
                Spacer()
                
                Button {
                    hapticImpact.impactOccurred()
                    playSound(sound: "sound-chime", type: "mp3")
                    showAlert.toggle()
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
                    .offset(y: moveUpward ?  0 : 80)
                }//: Button
            }//: vstack
            .padding(.top, 20)
            .padding(.bottom, 25)
            
        }
        .frame(width: 335, height: 545)
        .background(
            Gradient(colors: card.gradientColors)
        )
        .cornerRadius(16)
        .shadow(radius: 8)
        .onAppear() {
            withAnimation(.linear(duration: 1.2)) {
                fadeIn.toggle()
            }
            
            withAnimation(.linear(duration: 0.8)) {
                moveDownard.toggle()
                moveUpward.toggle()
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(card.title),
                message: Text(card.message),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

#Preview {
    CardView(card: cardData[1])
}
