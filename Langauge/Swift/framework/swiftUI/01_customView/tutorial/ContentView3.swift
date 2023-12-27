//
//  ContentView3.swift
//  tutorial
//
//  Created by 유승철 on 12/27/23.
//

import SwiftUI

struct ContentView3: View {
    
    let carStack = HStack {
        Text("Car Image")
        Image(systemName: "car.fill")
    }
    
    
    var body: some View {
        Text("Main title")
            .font(.largeTitle)
        carStack
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ContentView3()
}
