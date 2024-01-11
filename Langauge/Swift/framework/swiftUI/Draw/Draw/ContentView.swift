//
//  ContentView.swift
//  Draw
//
//  Created by 유승철 on 1/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            ScrollView {
                Circle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                
                Capsule()
                    .stroke(lineWidth: 10)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .frame(width: 200, height: 100)
                
                RoundedRectangle(cornerRadius: CGFloat(20))
                    .stroke(style: StrokeStyle(lineWidth: 8, dash: [CGFloat(10), CGFloat(5)]))
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .frame(width: 200, height:100)
                
                
                Ellipse()
                    .stroke(style: StrokeStyle(lineWidth: 20,
                                               dash: [10, 5, 2],
                                               dashPhase: 10))
                    .foregroundColor(.blue)
                    .frame(width: 250, height: 150)
                

            }
        }
        
    }
}

#Preview {
    ContentView()
}
