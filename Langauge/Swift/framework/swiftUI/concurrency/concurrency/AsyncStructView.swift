//
//  AsyncStructView.swift
//  concurrency
//
//  Created by 유승철 on 12/31/23.
//

import SwiftUI

struct AsyncStructView: View {
    var body: some View {
            Button(action: {
                Task {
                    await doSomething()
                }
            }) {
                Text("Do Something")
            }
        }
    
    struct MyStruct {
        var result: Date {
            get async {
                return await self.getTime()
            }
        }
        
        func getTime() async -> Date {
            sleep(2)
            return Date()
        }
    }
    
        
        func doSomething() async {
            let myStruct = MyStruct()
            Task {
                let date = await myStruct.result
                print("Date = \(date)")
            }
        }
        
}

#Preview {
    AsyncStructView()
}
