//
//  ContentView.swift
//  Observable
//
//  Created by 유승철 on 1/6/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var timeData: TimerData = TimerData()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Timer count = \(timeData.timeCount)")
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding()
                Button(action: timeData.resetCount) {
                    Text("Reset Counter")
                }
                
                NavigationLink(destination: SecondView()){
                    Text("Next Screen")
                }
                .padding()
            }
        }
        .environmentObject(timeData)
    }
}

#Preview {
    ContentView()
}
