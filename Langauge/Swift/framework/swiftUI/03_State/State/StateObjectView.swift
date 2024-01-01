/*
    iOS 14에 도입된 @StateObject는 @ObservedObject를 대안이다.
    @ObservedObject의 경우 사용하는 뷰에 속한 객체가 아니기 때문에
    사용하는 뷰가 아닌 다른 뷰에서 해당 객체를 사용할 경우 재렌더링 등 다른 이유로 해당 상태값의 손실이 발생할 수 있다.
    @StateObject는 선언한 뷰가 소유하므로 해당 뷰 또는 자식 뷰가 사용중이라면 상태값의 손실이 일어나지 않는다.
 
    @ObservedObject, @StateObject 둘은 완전히 상호 교환이 가능하므로,
 
    @ObservedObject 사용할 이유가 없다면 가급적 @StateObject를 사용하는 것을 권장한다.
    
 */

import SwiftUI

struct StateObjectView: View {
    
    @StateObject var demoData: DemoData = DemoData()
    
    var body: some View {
        VStack {
            Text("\(demoData.name) \(demoData.age)")
        }
        .padding()
    }
}

#Preview {
    StateObjectView()
}
