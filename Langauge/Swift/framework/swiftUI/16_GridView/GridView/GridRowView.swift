//
//  GridRowView.swift
//  GridView
//
//  Created by 유승철 on 1/10/24.
//

import SwiftUI

struct GridRowView: View {
    var body: some View {
        Grid(alignment: .topLeading, horizontalSpacing: 1, verticalSpacing: 1) {
            GridRow(alignment: .bottom) {
                CellContent(index: 0, color: .orange)
                Image(systemName: "record.circle.fill")
                    .gridColumnAlignment(.trailing)
                Image(systemName: "record.circle.fill")
                    .gridCellAnchor(.center)
                Image(systemName: "record.circle.fill")
                    .gridCellAnchor(.top)
                CellContent(index: 1, color: .yellow)
            }
            .font(.largeTitle)
            
            GridRow {
                CellContent(index: 0, color: .orange)
                Image(systemName: "record.circle.fill")
                Image(systemName: "record.circle.fill")
                Image(systemName: "record.circle.fill")
                CellContent(index: 1, color: .yellow)
            }
            .font(.largeTitle)
            
            GridRow {
                ForEach(1...5, id: \.self) { index in
                    CellContent(index: index, color: .red)
                }
            }
        }
    }
    
}

#Preview {
    GridRowView()
}
