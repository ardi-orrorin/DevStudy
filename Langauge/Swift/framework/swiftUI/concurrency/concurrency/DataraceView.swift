//
//  DataraceView.swift
//  concurrency
//
//  Created by 유승철 on 12/31/23.
//

import SwiftUI

struct DataraceView: View {
    
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
        var timeStamps: [Int: Date] = [:]
        
        await withTaskGroup(of: (Int, Date).self) { group in
            for i in 1 ... 5 {
                group.addTask {
//                    timeStamps[i] = await takesTooLong() // Multiple tasks are updating the same dictionary
                    return (i, await takesTooLong())
                }
            }
            
            for await (task, date) in group {
                timeStamps[task] = date
            }
            
            for (task, date) in timeStamps {
                print("Completed Task \(task) = \(date)")
            }
        }
    }
    func takesTooLong() async -> Date{
        sleep(2)
        return Date()
    }
}

#Preview {
    DataraceView()
}
