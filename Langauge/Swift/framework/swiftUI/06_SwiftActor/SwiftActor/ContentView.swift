// Actor
// 한 번에 하나의 작업만 데이터에 접근할 수 있도록 내부 변경 가능 상태에 대한 비동기 접근을 제어하는 스위프트 타입
// 데이터 변경시 setter를 이용해야 한다.


import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: {
                Task {
                    await someThing()
                }
            }){
                Text("Button")
            }
        }
        .padding()
    }
    
    func someThing() async {
        let builder = BuildMessage()
        await builder.setName(name: "Hong gil Dong")
        
        // builder.message = "message"
        // Actor-isolated property 'message' can not be mutated from a non-isolated context
        let message = await builder.message
        print(message)
    }
}

#Preview {
    ContentView()
}
