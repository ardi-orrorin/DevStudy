import SwiftUI

@MainActor
class BuildMessageMainActor {
    var timeStamps: [Int: Date] = [:]
    
    func addStamp(task: Int, date: Date) {
        timeStamps[task] = date
    }
}
