//
//  ContentView.swift
//  Gesture
//
//  Created by 유승철 on 1/13/24.
//

import SwiftUI

struct ContentView: View {
    
    let tap = TapGesture(count: 2)
        .onEnded { _ in
            print("Tapped")
        }
    
    let longPress = LongPressGesture(minimumDuration: 10, maximumDistance: 25) // 누르기 인식 최소 최대 시간
        .onEnded { i in // 액션 컬로저는 제스처가 완료될 때 호출
            print("Long Pressed")
            print("\(i)")
        }
    
    
    var body: some View {
        Image(systemName: "hand.point.right.fill")
            .gesture(longPress)
    }
}

#Preview {
    ContentView()
}
