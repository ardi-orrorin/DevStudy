//
//  ExampleActor.swift
//  SwiftActor
//
//  Created by 유승철 on 1/1/24.
//

import SwiftUI

struct ExampleActor: View {
    var body: some View {
        VStack {
            Button(action: {
                Task {
                    await someThing()
                }
            }){
                Text("Button")
            }
        }
        .padding()
    }
    
    func someThing() async {
        let store = TimeStore()
        
        await withTaskGroup(of: Void.self) { group in
            for i in 1...5 {
                group.addTask {
                    await store.addStamp(task: i, date: takesTooLong())
                }
            }
        }
        
        for (task, date) in await store.timeStamps {
            print("task: \(task), date: \(date)")
        }
    }
    
    func takesTooLong() async -> Date {
        sleep(2)
        return Date()
    }
    
    
}

#Preview {
    ExampleActor()
}
