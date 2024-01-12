//
//  ContentView.swift
//  animation
//
//  Created by 유승철 on 1/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rotation: Double = 0
    @State private var scale: CGFloat = 1
    
    var body: some View {
        
        Button(action: { withAnimation(.linear (duration: 2)) {
            self.rotation = (self.rotation < 360 ? self.rotation + 60 : 0)
        }
            self.scale = (self.scale < 2.8 ? self.scale + 0.3 : 1)
        }){
            Text("Click to Animate")
                .scaleEffect(scale)
                .rotationEffect(.degrees(rotation))
//                .animation(.linear(duration: 2), value: rotation)
//                .animation(.spring(response: 1, dampingFraction: 0.2, blendDuration: 0), value: rotation) // 스프링
//                .animation(Animation.linear(duration: 1).repeatCount(10), value: rotation) // 애니메이션 반복
        }
    }
}

#Preview {
    ContentView()
}
