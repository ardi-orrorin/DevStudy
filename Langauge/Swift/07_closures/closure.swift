// 클로저
/*
    명명된 함수 생성없이 실행되는 콛 그룹
    코드에서 주변에 전달과 사용할 수 잇는 자체 포함된 기능 브럭
    
    정의된 컨텍스트에서 모든 상수와 변수에 대한 참조를 캡처하고 저장할 수 있다.
    이러한  상수와 변수를 폐쇄라고 한다.
*/

// 클로저 표현식

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

var reversedNames = names.sorted(by: backward)
print(reversedNames)

// 클로저 표현식 문법
// 클로저의 본문의 시작은 in키워드로 시작한다.
/*
    표현 구문
    { (<#parameters#>) -> <#return type#> in
        <#statements#>
    }
*/
var reversedNames2 = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

print(reversedNames2)

// 컨테스트에서 타입 추론
// 정렬 클로저는 메서드에 인수로 전달되기 때문에 파라미터 타입과 반환되는 값이 추론할 수 있다.
// sorted(by:) 메서드는 (String, String) -> Bool 타입을 가지는 클로저를 인수로 받기 때문에,
// (String, String) -> Bool 타입의 클로저 표현식을 일부로 정의할 필요가 없다.
var reversedNames3 = names.sorted(by: { s1, s2 in return s1 > s2 })
print(reversedNames3)

// 단일 표현식 클로저의 암시적 반환
// 단일 표현 클로저는 return 키워드를 생략할 수 있다.
var reversedNames4 = names.sorted(by: { s1, s2 in s1 > s2 })
print(reversedNames4)

// 짧은 인수 이름
// $0 $1 $2 등 클로저의 인수값을 참조하는 데 사용할 수 있는 짧은 인수 이름을 제공한다.
var reversedNames5 = names.sorted(by: { $0 > $1 })
print(reversedNames5)

// 연산자 메소드
var reversedNames6 = names.sorted(by: >)
print(reversedNames6)

// 후행 클로저
// 함수의 마지막 인수로 함수에 클로저 표현식을 전달해야하고, 클로저 표현식이 긴 경우 후행 클로저로 작성할 수 있다.
// 주로 한 줄로 작성하기 불가능할 때 유용하다.
func somFunctionTahtTakesAClosure(closure: () -> Void) {
    // 함수의 본문
}

somFunctionTahtTakesAClosure(closure: {
    // 클로저의 본문
})

somFunctionTahtTakesAClosure() {
    // 클로저의 본문
}

let names2 = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

var reversedNames7 = names2.sorted() { $0 > $1 } 
print(reversedNames7)
var reversedNames8 = names2.sorted { $0 > $1 }
print(reversedNames8)

let digitNames = [
    0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]

let numbers = [16, 58, 510]

let strings = numbers.map { number -> String in
    var number = number
    var output = ""
    
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    
    return output
}

print(strings) // ["OneSix", "FiveEight", "FiveOneZero"]

// 여러개 함수 클로저

func loadPicture(from server: Server, Completion: (Picture) -> Void, onFailure: () -> Void) {
    if let picture = download("photo.jpg", from: server) {
        Completion(picture)
    } else {
        onFailure()
    }
}

loadPicture(from: someServer) { picture in
    someView.currentPicture = picture
} onFailure: {
    print("Couldn't download the next picture.")
}

// 캡처값
// 클로저로 정의된 컨텍스트에서 상수와 변수를 캡처할 수 있다.
// 여기서 캡처는 정보를 은닉하고 메모리에 저장하는 것을 의미한다.
// 그러면 호출시 정의한 함수를 벗어나더라도 그 정보를 사용할 수 있다.

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount    
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
print(incrementByTen()) // 10
print(incrementByTen()) // 20
print(incrementByTen()) // 30

// 클로저의 참조 타입

let alsoIncrementByTen = incrementByTen
print(alsoIncrementByTen()) // 40   
print(alsoIncrementByTen()) // 50


// 탈출 클로저 **복습 필요**
// 함수에 인수로 클로저를 전달하지만 반환된 후 호출되는 클로저를 탈출 클로저라고 한다.
// 클로저를 파라미터로 값는 함수를 선언할 때는 이 클로저가 탈출 함수라는 것을 나타내기위해 @escaping을 앞에 사용한다.
// 클로저가 탈출할 수 있는 한 가지 방법은 함수 바깥에 정의된 변수에 저장되는 것이다.
// 

var completeionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completeionHandlers.append(completionHandler)
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 } // 탈출 클로저에서 self를 사용하면 self를 명시적으로 사용해야한다.
        someFunctionWithNonescapingClosure { x = 200 } // 비탈출 클로저에서는 self를 사용하지 않아도 암시적으로 사용된다.
    }
}

let insatance = SomeClass()
insatance.doSomething()
print(insatance.x) // 200

completeionHandlers.first?()
print(insatance.x) // 100
print(completeionHandlers)

class SomeOtherClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { [self] in x = 100 } 
        someFunctionWithNonescapingClosure { x = 200 } 
    }
}

// self는 클래스 구조체 열거형 인스턴스면 암시적으로 참조할 수 있다. 
// 하지만 클래스 이외에 구조체 열거형에서는 @escaping 클로저에서는 self를 참조할 수 없다.

struct SomeStruct {
    var x = 10
    mutating func doSomething() {
        someFunctionWithNonescapingClosure { x = 200 } 
        // someFunctionWithEscapingClosure { x = 100 } // 오류
    }
}

// 자동 클로저
/*
    함수에 인수로 전달 되는 표현식을 래핑하기 위해 자동 생성되는 클로저로, 
    인수를 가지지 않으며 호출될 때 내부엣 래핑된 표현식의 값을 반환한다.
*/

var customerInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print("customerInLine.count = \(customerInLine.count)") // customerInLine.count = 5

let customerProvider = { customerInLine.remove(at: 0) }
print("customerInLine.count = \(customerInLine.count)") // 클로저가 실행되지 않았기 때문에 5

print("Now serving \(customerProvider())!") // remove(at: 0)이 실행되어 Chris가 반환된다.
print("customerInLine.count = \(customerInLine.count)") // 클로저가 실행되어 4

// 함수의 인수로 클로저를 전달하면 위와 같은 지연 판단과 동일한 동작을 가질 수 있다.
func serve(customer customerProvider: () -> String) {
    print("Now serving  \(customerProvider())!")
}
serve(customer: { customerInLine.remove(at: 0) }) // Now serving Alex!

// @autoclosure 속성으로 표시되므로 인수는 자동으로 클로저로 반환된다.

func serve2(customer customerProvider: @autoclosure ()-> String) {
    print("Now serving  \(customerProvider())!")
}
serve2(customer: customerInLine.remove(at: 0)) // Now serving Ewa! {}를 생략할 수 있다.


