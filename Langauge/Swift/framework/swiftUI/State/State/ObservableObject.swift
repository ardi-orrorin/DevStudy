
import Foundation
import Combine

class DemoData: ObservableObject {
    // @Published 프로퍼티 래퍼
    // 프로퍼티의 값이 변경될 때마다 뷰를 다시 그린다.
    @Published var name: String = ""
    @Published var age: Int = 0
    
    init(){
        // 데이터 초기화하기 위한 코드
        updateData()
    }
    func updateData(){
        // 데이터를 최신 상태로 유지하기 위한 코드
    }
}
