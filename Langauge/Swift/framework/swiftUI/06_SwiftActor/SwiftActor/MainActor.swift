// 스위프트에서 메인 스레드는 메인 액터(Main Actor)로 표현된다.
// 이것을 전역 액터(Global Actor)라고 한다.
import SwiftUI

struct MainActor: View {
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    MainActor()
}
