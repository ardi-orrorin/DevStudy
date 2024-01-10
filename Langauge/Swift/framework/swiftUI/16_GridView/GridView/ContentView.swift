//
//  ContentView.swift
//  GridView
//
//  Created by 유승철 on 1/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Grid(horizontalSpacing: 1, verticalSpacing: 1) {
            GridRow {
                ForEach(1...5, id: \.self) { index in
                    if (index % 2 == 1) {
                        CellContent(index: index, color: .red)
                    } else {
                        Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                    }
                }
            }
            
            GridRow {
                ForEach(6...8, id: \.self) { index in
                    CellContent(index: index, color: .blue)
                }
            }
            
            GridRow {
                ForEach(11...12, id: \.self) { index in
                    CellContent(index: index, color: .yellow)
                }
            }
            CellContent(index: 1, color: .brown)
            
            GridRow {
                CellContent(index: 17, color: .orange)
                    .gridCellColumns(2)
                
                CellContent(index: 18, color: .indigo)
                    .gridCellColumns(3)
            }
        }
        
        
        
        
        
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
