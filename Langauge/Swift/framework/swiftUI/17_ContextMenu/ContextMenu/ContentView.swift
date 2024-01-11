//
//  ContentView.swift
//  ContextMenu
//
//  Created by 유승철 on 1/11/24.
//

// ContextMenu
// 사용자가 뷰를 롱 프레스(Long Press) 했을 때 나타나는 메뉴

import SwiftUI

struct ContentView: View {
    
    
    @State private var foregroundColor: Color = .black
    @State private var backgroundColor: Color = .white
    
    var body: some View {
        Text("Hello, world!")
            .padding()
            .font(.largeTitle)
            .foregroundColor(foregroundColor)
            .background(backgroundColor)
            .contextMenu {
                Button(action: {
                    self.foregroundColor = .black
                    self.backgroundColor = .white
                }) {
                    Text("Normal Colors")
                    Image(systemName: "paintbrush")
                }
                
                Button(action: {
                    self.foregroundColor = .white
                    self.backgroundColor = .black
                }) {
                    Text("Unverted Colors")
                     Image(systemName: "paintbrush.fill")
                }
            }
    }
}

#Preview {
    ContentView()
}
