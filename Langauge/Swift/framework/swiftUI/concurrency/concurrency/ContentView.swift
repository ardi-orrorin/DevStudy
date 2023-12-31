//
//  ContentView.swift
//  concurrency
//
//  Created by 유승철 on 12/31/23.
//


// aysnc await
// async : 비동기 처리 선언
// await : 비동기 처리중 처리가 될 때까지 멈춰야 할 대

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button(action: {
            Task {
                await doSomething()
            }
        }) {
            Text("Do Something")
        }
    }
    
    func doSomething() async {
        print("Start \(Date())")
        await takesTooLong()
        print("End \(Date())")
    }
    func takesTooLong() async{
        sleep(5)
        print("Asnyc task completed at \(Date())")
    }
}

#Preview {
    ContentView()
}
