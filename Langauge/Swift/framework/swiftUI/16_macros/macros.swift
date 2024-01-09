// 매크로
// 소스코드를 컴파일 할 때 변환하므로 반복적인 코드를 직접 작성하지 않아도 된다.
// 컴파일 하는 동안 Swift코드를 빌드하기 전에 코드에 모든 매크로를 확장한다.

// 독립 매크로(Freestanding macro)는 선언에 첨부되지 않고 자체적으로 나타난다.
// 첨부 매크로(Attached macro)는 매크로가 첨부된 선언을 수정합니다.


// 독립 매크로
// 이름 앞에 #를 작성하고 이름 뒤에  소괄호 안에 매크로 의 인수를 작성한다.
func myFunction() {
    print("Currentl running \(#function)")
    #warning("Something's wrong")
}

myFunction()

// 첨부 매크로
// 첨부 매크로를 호출하려면 매크로 이름 앞에 @를 작성하고 매크로 일므 뒤 소괄호에 인수를 작성한다.

// 매크로를 사용하지 않은 버전
struct SundaeToppings: OptionSet {
    let rawValue: Int
    static let nuts = SundaeToppings(rawValue: 1 << 0)
    static let cherry = SundaeToppings(rawValue: 1 << 1)
    static let fudge = SundaeToppings(rawValue: 1 << 2)   
}


// 매크로를 사용한 버전
@OptionSet<Int>
struct SundaeToppings {
    private enum Options: Int {
        case nuts
        case cherry
        case fudge
    }
}

// 매크로 선언(Macro Declaration)

public macro OptionSet<RawType>() = #externalMacro(module: "SwiftMacros", type: "OptionSetMacro")


