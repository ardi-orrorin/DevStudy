//
//  ContentView.swift
//  LifeCycle
//
//  Created by 유승철 on 1/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            FirstTabView()
                .tabItem {
                    Image(systemName: "01.circle")
                }
            SecondTabView()
                .tabItem {
                    Image(systemName: "02.circle")
                }
        }
    }
}

#Preview {
    ContentView()
}
