//
//  TaskGroupView.swift
//  concurrency
//
//  Created by 유승철 on 12/31/23.
//

import SwiftUI

struct TaskGroupView: View {
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
        await withTaskGroup(of: Void.self) { group in
            for i in 1 ... 5 {
                group.addTask {
                    let result = await takesTooLong()
                    print("Completed Task \(i) = \(result)")
                }
                //group.isCancelled {} 작업 그룹이 이미 취소되었는지 나타내는 메소드 -> Bool
                // group.cancelAll {} 작업 그룹에 대한 모든 작업을 취소
                // group.isEmpty 작업 그룹 ㄴ애ㅔ 작업이 남아 있는지 나타내는 메소드 -> Bool
            }
        }
    }
    func takesTooLong() async -> Date{
        sleep(5)
        return Date()
    }
}

#Preview {
    TaskGroupView()
}
