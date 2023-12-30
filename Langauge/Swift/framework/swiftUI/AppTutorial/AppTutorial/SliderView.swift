//
//  SliderView.swift
//  basic
//
//  Created by 유승철 on 12/30/23.
//

import SwiftUI

struct SliderView: View {
    
    var colors: [Color] = [.red, .green, .blue, .yellow, .black]
    var colorNames = ["Red", "Green", "Blue", "Yellow", "Black"]
    
    @State private var colorIndex = 0
    @State private var rotation: Double = 0.0
    @State private var text: String = "Welcome to SwiftUI"
    
    var body: some View {
        Spacer()
        Text(text)
            .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .rotationEffect(.degrees(rotation))
            .animation(.easeInOut(duration: 5), value: rotation)
            .foregroundColor(colors[colorIndex])
        Spacer()
//        Divider() // 스택 컨테이너 안의 두 뷰 사이가 분리음ㅇ르 나타내느 라인을 그린다.
            
        
        Slider(value: $rotation, in: 0 ... 360, step: 0.1)
            .padding()
        
        TextField("Enter text here", text: $text)
            .textFieldStyle(.roundedBorder)
            .padding()
        
        Picker(selection: $colorIndex, label: Text("Color")) {
            ForEach(0 ..< colorNames.count, id: \.self) {
                Text(colorNames[$0])
                    .foregroundColor(colors[$0])
            }
        }
        .pickerStyle(.wheel)
        .padding()
    }
}

#Preview {
    SliderView()
}
