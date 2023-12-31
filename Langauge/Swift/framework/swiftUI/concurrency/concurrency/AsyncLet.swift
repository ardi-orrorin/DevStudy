//
//  AsyncLet.swift
//  concurrency
//
//  Created by 유승철 on 12/31/23.
//

// Async Let
// Async : 비동기 처리
// let : 처리되는 동안 백그라운드에서 처리되도록 한다.
import SwiftUI

struct AsyncLet: View {
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
        async let result: Date = takesTooLong() // async let 바인딩 await로 호출되기 전까지 참조만 한 상태
        print("After async-let \(Date())")
        print("result = \(await result)") // 비동기 함수 호출
        print("End \(Date())")
    }
    func takesTooLong() async -> Date{
        sleep(5)
        return Date()
    }
}

#Preview {
    AsyncLet()
}
