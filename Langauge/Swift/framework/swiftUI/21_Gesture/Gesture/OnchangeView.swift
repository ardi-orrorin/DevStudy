//
//  OnchangeView.swift
//  Gesture
//
//  Created by 유승철 on 1/13/24.
//

import SwiftUI

struct OnchangeView: View {
    
    @State private var magnification: CGFloat = 1.0
    
    var body: some View {
        
        let magnificationGesture = MagnificationGesture(minimumScaleDelta: 0)
            .onChanged { value in // 핀칭을 감지
                self.magnification = value
            }
            .onEnded { _ in
                print("Gesture Ended")
            }
        
        return Image(systemName: "hand.point.right.fill")
            .resizable()
            .gesture(magnificationGesture)
            .font(.largeTitle)
            .scaleEffect(magnification)
            .frame(width: 100, height: 100)
        
    }
}

#Preview {
    OnchangeView()
}
