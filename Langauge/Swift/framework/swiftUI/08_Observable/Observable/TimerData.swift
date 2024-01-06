import Foundation
import Combine

class TimerData : ObservableObject {
    @Published var timeCount = 0
    var timer : Timer?
    
    init() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, 
                                     target: self,
                                     selector: #selector(timerAction),
                                     userInfo: nil,
                                     repeats: true
        )
    }
    
    // @objc swift 코드뿐만 아니라 Objective-C에서도 해당 속성을 사용할 수 있도록 지시합니다.
    @objc func timerAction() {
        timeCount += 1
    }
    
    func resetCount(){
        timeCount = 0
    }
}
