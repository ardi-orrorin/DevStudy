//
//  UpdatingView.swift
//  Gesture
//
//  Created by 유승철 on 1/13/24.
//



import SwiftUI

struct UpdatingView: View {
    
    @GestureState private var offset: CGSize = .zero
    @GestureState private var longPress: Bool = false
    @State private var dragEnabled: Bool = false
    
    
    var body: some View {
        
//        let longPressAndDrag = LongPressGesture(minimumDuration: 1)
//            .updating($longPress) { val, state, transaction in
//                state = val
//            }
//            .simultaneously(with: DragGesture()) 동시 인식
//            .updating($offset) { val, state, transaction in
//                state = val.second?.translation ?? .zero
//            }
//        
//        let drag = DragGesture()
//            .updating($offset) { dragValue, state, transaction in
//                state = dragValue.translation
//            }
        
        let longPressBeforeDrag = LongPressGesture(minimumDuration: 1)
            .onEnded { _ in
                self.dragEnabled = true
            }
            .sequenced(before: DragGesture()) // 순차 인식 first가 먼저 완료되야 second가 실행
            .updating($offset) { val, state, trans in
                switch val {
                case .first(true):
                    print("Long Press in pregress")
                case .second(true, let drag):
                    state = drag?.translation ?? .zero
                default: break
                }
            }
            .onEnded { val in
                self.dragEnabled = false
            }
        
        return Image(systemName: "hand.point.right.fill")
            .foregroundColor(dragEnabled ? .red : .blue)
            .font(.largeTitle)
            .offset(offset)
            .gesture(longPressBeforeDrag)
        
    }
}

#Preview {
    UpdatingView()
}
