//
//  isolationView.swift
//  SwiftActor
//
//  Created by 유승철 on 1/1/24.
//

import SwiftUI

struct IsolationView: View {
    var builder = BuildMessage()
    var body: some View {
        VStack {
            Button(action: {
                Task {
                    await asyncFunction()
                    syncFunction()
                }
            }){
                Text("Button")
            }
        }
        .padding()
    }
    
    func asyncFunction() async {
        let greeting = builder.getGreeting()
        print(greeting)
    }
    
    func syncFunction() {
        let greeting = builder.getGreeting()
        print(greeting)
    }
    
    
}

#Preview {
    IsolationView()
}
