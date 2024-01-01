import SwiftUI

actor TimeStore {
    var timeStamps: [Int: Date] = [:]
    
    func addStamp(task: Int, date: Date) {
        timeStamps[task] = date
    }
    
}
