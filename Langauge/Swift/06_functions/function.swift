// Function

func greet(person: String) -> String { /// -> 으로 반환 타입을 명시한다.
    let greeting = "Hello, " + person + "!"
    return greeting
}
print("Function: " + greet(person: "Anna"))


// 함수의 반환값은 호출될 때 무시될 수 있다.
func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}
func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string) /// _ 로 반환값을 무시한다.
}
printAndCount(string: "hello, world")
printWithoutCounting(string: "hello, world")

// 여러개 반환값이 있는 함수
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0], currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin { currentMin = value }
        if value > currentMax { currentMax = value }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")

// 옵셔널 튜플 반환 타입
func minMax2(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0], currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin { currentMin = value }
        if value > currentMax { currentMax = value }
    }
    return (currentMin, currentMax)
}
if let bounds2 = minMax2(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds2.min) and max is \(bounds2.max)")
}

// 암시적 반환 표현
func greeting(for person: String) -> String {
    "Hello, " + person + "!"
}
print("암시적 반환 표현: " + greeting(for: "Dave"))

func anotherGreeting(for person: String) -> String {
    return "Hello, " + person + "!"
}
print("암시적 반환 표현: " + anotherGreeting(for: "Dave"))

// 함수 인자 레이블과 매개변수 이름
func someFunction(firstParameterName: Int, secondParameterName: Int) {
    print("firstParameterName: \(firstParameterName), secondParameterName: \(secondParameterName)")
}
someFunction(firstParameterName: 1, secondParameterName: 2)

func someFunction(argumentLabel parameterName: Int) {
    print("parameterName: \(parameterName)")
}
someFunction(argumentLabel: 3)

// 인자 레이블의 생략
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    print("firstParameterName: \(firstParameterName), secondParameterName: \(secondParameterName)")
}
someFunction(1, secondParameterName: 2)

// 기본값을 가지는 매개변수
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    print("parameterWithoutDefault: \(parameterWithoutDefault), parameterWithDefault: \(parameterWithDefault)")
}

someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6)
someFunction(parameterWithoutDefault: 4)

// 가변 매개변수 (Variadic Parameters)
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers { total += number }
    return total / Double(numbers.count)
}

print("가변 매개변수: " + String(arithmeticMean(1, 2, 3, 4, 5)))
print("가변 매개변수: " + String(arithmeticMean(3, 8.25, 18.75)))

// inout 매개변수
// 함수의 매개변수는 기본적으로 상수이다. 따라서 함수의 매개변수를 변경하려고 하면 컴파일 오류가 발생한다.
// 하지만 종료후에도 변경된 값을 유지하고 싶으면 inout 키워드를 사용하면 된다.
func swapTwoIntDefulat(_ a: Int, _ b: Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt1 = 3
var someInt2 = 107
swapTwoIntDefulat(someInt1, someInt2) // 컴파일 오류 발생
print("inout 매개변수: someInt1 is \(someInt1), and someInt2 is \(someInt2)")  

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt1 = 3
var someInt2 = 107

swapTwoInts(&someInt1, &someInt2) // 함수에 수정 가능함을 알려주기 위해 &를 사용한다.
print("inout 매개변수: someInt1 is now \(someInt1), and someInt2 is now \(someInt2)")

// 함수 타입
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

// 함수타입 사용
var mathFunction: (Int, Int) -> Int = addTwoInts
print("함수 타입: \(mathFunction(2, 3))") // 함수 타입: 5

// 타입으로 일치하는 다른 함수를 같은 변수에 할당할 수 있다.
mathFunction = multiplyTwoInts
print("함수 타입: \(mathFunction(2, 3))") // 함수 타입: 6

// 함수형 파라미터
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("함수형 파라미터: \(mathFunction(a, b))")
}
printMathResult(mathFunction, 3, 5) // 함수형 파라미터: 15

// 함수형 반환타입
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}
func chooseStepFunction(backward: Bool) -> (Int) -> Int { // 함수를 반환하는 함수
    return backward ? stepBackward : stepForward
}
var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0) // 함수를 반환받아 변수에 할당
print("함수형 반환타입: \(moveNearerToZero(currentValue))") // 함수형 반환타입: 4

while currentValue != 0 {
    print("함수형 반환타입: \(currentValue)")
    currentValue = moveNearerToZero(currentValue)
}
print("함수형 반환타입: zero!") // 함수형 반환타입: zero!

// 중첩 함수
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
var currentValue = -4
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
while currentValue != 0 {
    print("중첩 함수: \(currentValue)")
    currentValue = moveNearerToZero(currentValue)
}
print("중첩 함수: zero!")


