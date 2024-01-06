// onChange
// 상태가 변경되면 action을 하는 함수
// of: 감시할 상태,
// action 실행구문
import SwiftUI

struct SecondTabView: View {
    
    @State private var text: String = ""
    @State private var newText: String = ""
    @State private var oldText: String = ""
    
    var body: some View {
        VStack {
            TextEditor(text: $text)
                .padding()
                .onChange(of: text) { oldValue, newValue in
                    newText = newValue
                    oldText = oldValue
                }
            HStack {
                VStack{
                    Text( "New Text")
                        .padding()
                    Text(newText)
                }
                .padding()
                VStack{
                    Text("Old Text")
                        .padding()
                    Text(oldText)
                        
                }.padding()
                
            }
        }
        
    }
}

#Preview {
    SecondTabView()
}
