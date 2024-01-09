//
//  LazyHGridView.swift
//  Grid
//
//  Created by 유승철 on 1/9/24.
//

import SwiftUI

struct LazyHGridView: View {
    private var colors : [Color] = [.blue, .yellow, .green]
//    private var gridTItems = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//    ]
    
//    private var gridTItems = [
//        GridItem(.adaptive(minimum: 50))
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
    
//    private var gridTItems = [
//        GridItem(.fixed(150)),
//        GridItem(.adaptive(minimum: 50)),
//        GridItem(.fixed(150)),
//    ]
    
    private var gridTItems = [
        GridItem(.fixed(150)),
        GridItem(.flexible(minimum: 50)),
        GridItem(.fixed(150)),
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: gridTItems, spacing: 5) {
                ForEach((0...99), id: \.self) { index in
                    CellContentView(index: index, color: colors[index % colors.count])
                }
            }
        }
        .padding(5)
    }
}


struct CellContentView: View {
    
    var index: Int
    var color: Color
    
    var body: some View {
        Text("\(index)")
            .frame(minWidth: 75, minHeight: 50, maxHeight: .infinity)
            .background(color)
            .cornerRadius(8)
            .font(.system(.largeTitle))
    }
}

#Preview {
    LazyHGridView()
}
