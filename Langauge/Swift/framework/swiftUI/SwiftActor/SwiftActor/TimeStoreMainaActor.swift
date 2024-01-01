import SwiftUI

@MainActor // Struct 'MainActor' cannot be used as an attribute 문제 발생
class TimeStoreMainaActor {
    var timeStamps: [Int: Date] = [:]

    func addStamp(task: Int, date: Date) {
        timeStamps[task] = date
    }
}

func runExample() async {
    await MainActor.run {
        print("Hello, world!")
        
    }
}

await runExample()
