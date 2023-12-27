//
//  ContentView4.swift
//  tutorial
//
//  Created by 유승철 on 12/27/23.
//

import SwiftUI

struct ContentView4: View {
    var body: some View {
        Label(
            title: {
                Text("Welcom to SwiftUI")
                    .font(.largeTitle)
            },
            icon: {
                Circle()
                    .fill()
                    .frame(width: 25, height: 25)
            }
        )
        MyVStack {
            Text("Text 1")
            Text("Text 2")
            HStack {
                Image(systemName: "star.fill")
                Image(systemName: "star.fill")
                Image(systemName: "star")
            }
        }
        Button(action: btnPressed) {
            Image(systemName: "square.and.pencil")
        }
    }
    func btnPressed() {
        print("Button pressed!")
    }
}

#Preview {
    
    ContentView4()
}
