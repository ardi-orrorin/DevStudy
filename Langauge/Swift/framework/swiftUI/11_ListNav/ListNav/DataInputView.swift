import SwiftUI

struct DataInputView: View {
    
    var title: String
    
    @Binding var userInput: String
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}

#Preview {
    DataInputView(title: "Name", userInput: .constant("Tesla"))
}
