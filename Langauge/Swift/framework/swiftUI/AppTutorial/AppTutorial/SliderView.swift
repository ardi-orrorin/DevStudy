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
        Text(text)
            .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .rotationEffect(.degrees(rotation))
            .animation(.easeInOut(duration: 5), value: rotation)
        Slider(value: $rotation, in: 0 ... 360, step: 0.1)
        
        TextField("Enter text here", text: $text)
            .textFieldStyle(.roundedBorder)
        
        Picker(selection: $colorIndex, label: Text("Color")) {
            ForEach(0 ..< colorNames.count, id: \.self) {
                Text(colorNames[$0])
                    .foregroundColor(colors[$0])
            }
        }
        .pickerStyle(.wheel)
    }
}

#Preview {
    SliderView()
}
