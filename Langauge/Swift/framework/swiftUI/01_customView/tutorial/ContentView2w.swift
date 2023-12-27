//
//  ContentView2w.swift
//  tutorial
//
//  Created by 유승철 on 12/27/23.
//

import SwiftUI

struct ContentView2w: View {
    
    @State var fileopen: Bool = true
    
    var body: some View {
        
        var myString: String = "File closed"
        if(fileopen) {
            myString = "File open"
        }
        
        return VStack {
            HStack {
                Text(myString)
                    .padding()
                Text("GoodBye, world")
            }
        }
        
    }
}

#Preview {
    ContentView2w()
}
