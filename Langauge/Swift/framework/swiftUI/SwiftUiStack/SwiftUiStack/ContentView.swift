//
//  ContentView.swift
//  SwiftUiStack
//
//  Created by 유승철 on 12/28/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Image(systemName: "goforward.10")
            Image(systemName: "goforward.15")
            Image(systemName: "goforward.30")
        }
        .font(.largeTitle)
        .foregroundColor(.blue)
    }
}

#Preview {
    ContentView()
}
