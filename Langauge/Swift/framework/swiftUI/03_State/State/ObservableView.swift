// Observable 객체
/*
    @State는  해당 뷰에만 적용할 수 있다.
    이를 하위에서 접근하기위해서는 @Binding을 사용해야 하는데,
    또한 부모의 뷰가 사라지면 해당 상태값이 사라지기 때문에,
    Observable 객체를 사용한다.
    Observable 객체는 여러 다른 뷰에서도 접근할 수 있으니 어느 한 뷰에 귀속되지 않아 뷰가 사라져도 상태값에 접근할 수 있다.
     
 */
import SwiftUI

struct ObservableView: View {
    
    @ObservedObject var demeData: DemoData = DemoData()
    
    
    var body: some View {
        Text("\(demeData.name) \(demeData.age)")
        TextField(text: $demeData.name) {
            Text("Enter to Text Name")
            Text("Enter to Text Name")
        }
    }
}

#Preview {
    ObservableView(demeData: DemoData())
}
