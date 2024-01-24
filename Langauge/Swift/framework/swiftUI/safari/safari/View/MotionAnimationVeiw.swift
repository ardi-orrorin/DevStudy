//
//  MotionAnimationVeiw.swift
//  safari
//
//  Created by 유승철 on 1/24/24.
//

import SwiftUI

struct MotionAnimationVeiw: View {
    
    // MARK: - PROPERTIES
    
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimaiting: Bool = false
    
    func randomCoordiante(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 10...300))
    }
    
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    func randomSpeed() -> Double {
        return Double.random(in: 0.025...1.0)
    }
 
    // MARK: - BODY
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimaiting ? randomScale() : 1)
                        .position(
                            x: randomCoordiante(max: geometry.size.width),
                            y: randomCoordiante(max: geometry.size.height)
                        )
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(randomSpeed())
//                                .delay()
                        )
                        .onAppear(perform: {
                            isAnimaiting = true
                        })
                } //: LOOP
            } //: ZSTACK
            .drawingGroup()
        }//: GEOMETRY
    }
}

#Preview {
    MotionAnimationVeiw()
}
