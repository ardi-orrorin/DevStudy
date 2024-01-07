//
//  ContentView.swift
//  NavigationSplitView
//
//  Created by 유승철 on 1/7/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var colors = ["Red","Green", "Blue" ]
    @State private var selectedColor: String?
    @State private var columnVisibility = NavigationSplitViewVisibility.detailOnly
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            List(colors, id: \.self, selection: $selectedColor) {
                Text($0).tag($0)
            }
            .navigationSplitViewColumnWidth(200)
        } detail: { // 세부사향 뷰
            Text(selectedColor ?? "No color selected")
        }
        .navigationSplitViewStyle(.automatic)
//        content: { // 콘텐츠 목록\
//            Text(selectedColor ?? "No color selected")
//        }
    }
}

#Preview {
    ContentView()
}
