//
//  ContentView.swift
//  TabView
//
//  Created by 유승철 on 1/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection = 1
    
    var body: some View {
        TabView(selection: $selection) {
            Text("First Content View  \(selection)")
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("Screen One")
                }.tag("1 one")
                
            Text("Second Content View \(selection)")
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Screen Two")
                }.tag("2 two")
            Text("Third Content View \(selection)")
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("Screen Three")
                }.tag("3 threse")
        }
        .font(.largeTitle)
//        .tabViewStyle(PageTabViewStyle())
    }
}

#Preview {
    ContentView()
}
