//
//  ContentView.swift
//  tutorial
//
//  Created by 유승철 on 12/27/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Text 1")
            Text("Text 2")
            HStack {
                Text("Text 3")
                Text("Text 3")
            }
            ContentView2w()
        }
        .padding(10)
        
        Text("Text 4")
        
        Text("Hello, ") + Text("how ") + Text("are You?")
    }
}

#Preview {
    ContentView()
}
