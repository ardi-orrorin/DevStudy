//
//  AutoStart.swift
//  animation
//
//  Created by 유승철 on 1/12/24.
//

import SwiftUI

struct AutoStart: View {
    
    @State private var rotation: Double = 0
    @State private var isSpinning: Bool = true
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 2)
                .foregroundColor(.blue)
                .frame(width: 360, height: 360)
            Image(systemName: "forward.fill")
                .font(.largeTitle)
                .offset(y: -180)
                .rotationEffect(.degrees(rotation))
                .animation(Animation.linear(duration: 5)
                    .repeatForever(autoreverses: false), value: rotation)
            
        }
        .onAppear() {
            self.isSpinning.toggle()
            rotation = isSpinning ? 0 : 360
        }
    }
}

#Preview {
    AutoStart()
}
