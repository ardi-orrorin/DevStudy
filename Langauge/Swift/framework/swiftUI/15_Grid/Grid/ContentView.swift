//
//  ContentView.swift
//  Grid
//
//  Created by 유승철 on 1/9/24.
//

import SwiftUI

struct ContentView: View {
    
    private var colors : [Color] = [.blue, .yellow, .green]
//    private var gridTItems = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//    ]
    
//    private var gridTItems = [
//        GridItem(.adaptive(minimum: 100))
//    ]
    
//    private var gridTItems = [
//        GridItem(.fixed(75)),
//        GridItem(.fixed(125)),
//        GridItem(.fixed(175)),
//    ]
    
//    private var gridTItems = [
//        GridItem(.fixed(85)),
//        GridItem(),
//        GridItem(),
//    ]
    
    private var gridTItems = [
        GridItem(.fixed(100)),
        GridItem(.adaptive(minimum: 50)),
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridTItems, spacing: 2) {
                ForEach((0...99), id: \.self) { index in
                    CellContent(index: index, color: colors[index % colors.count])
                }
            }
        }
        .padding(5)
    }
}


struct CellContent: View {
    
    var index: Int
    var color: Color
    
    var body: some View {
        Text("\(index)")
            .frame(minWidth: 50, maxWidth: .infinity, minHeight: 100)
            .background(color)
            .cornerRadius(8)
            .font(.system(.largeTitle))
    }
}

#Preview {
    ContentView()
}
