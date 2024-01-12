//
//  TransitionView.swift
//  animation
//
//  Created by 유승철 on 1/12/24.
//

import SwiftUI

struct TransitionView: View {
    
    @State private var isButtonVisible: Bool = true
    var body: some View {
        VStack {
            Toggle(isOn: $isButtonVisible.animation(.linear(duration: 0.5))) {
                Text("Show/Hide")
            }
            .padding()
            
            if isButtonVisible {
                Button(action: {}) {
                    Text("Example Button")
                }
                .font(.largeTitle)
//                .transition(.move(edge: .top))
                .transition(.fadeAndMove)
            }
        }
    }
}

//  전환 결합하기
extension AnyTransition {
    static var fadeAndMove: AnyTransition {
        AnyTransition.opacity.combined(with: .move(edge: .top))
    }
}

#Preview {
    TransitionView()
}
