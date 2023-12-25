// 술어(Terminology)
// 단향(Unary) : -a같은 단일 항목에 동작한다.
// 이항(Binary) : a + b 같은 두 항목에 동작한다.
// 삼항(Ternary) : a ? b : c 같은 세 항목에 동작한다.


// 대입 연산자(Assignment Operator)
let b = 10
var a = 5
a = b

// 튜플을 사용하여 여러 변수에 값을 한 번에 할당할 수 있다.
let (x, y) = (1, 2)

// 산술 연산자(Arithmetic Operators)
1 + 2 // 더하기
5 - 3 // 빼기
2 * 3 // 곱하기
10.0 / 2.5 // 나누기
"Hello, " + "world" // 문자열 더하기

// 나머지 연산자(Remainder Operator)
9 % 4 // 1

// 단항 음수 연산자(Unary Minus Operator)
let three = 3
let minusThree = -three // -3
let plusThree = -minusThree // 3
print("minusThree: \(minusThree), plusThree: \(plusThree)") // minusThree: -3, plusThree: 3

// 단항 양수 연산자(Unary Plus Operator)
let minusSix = -6
let alsoMinusSix = +minusSix // -6
print("minusSix: \(minusSix), alsoMinusSix: \(alsoMinusSix)") // minusSix: -6, alsoMinusSix: -6

// 복합 할당 연산자(Compound Assignment Operators)
var a1 = 1
a1 += 2 // a1 = a1 + 2
print("a1: \(a1)") // a1: 3

// 비교 연산자(Comparison Operators)
1 == 1 // true
2 != 1 // true
2 > 1 // true
1 < 2 // true
1 >= 1 // true
2 <= 1 // false

// swfit 표준 라이브러리는 7개 미만의 요소를 가지고 있는 듀플에 대해서 비교 연산자를 제공
(1, "zebra") < (2, "apple") // true
(3, "apple") < (3, "bird") // true
(4, "dog") == (4, "dog") // true

("blue", -1) < ("purple", 1) // true
// ("blue", false) < ("purple", true) // 오류 발생


// 삼항 조건 연산자(Ternary Conditional Operator)
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20) // 90

// Nil 병합 연산자(Nil-Coalescing Operator)
a != nil ? a! : b // a가 nil이 아니면 강제 언래핑

let defaultColorName = "red"
var userDefinedColorName: String? // 기본값은 nil
var colorNameToUse = userDefinedColorName ?? defaultColorName

// 범위 연산자(Range Operators)
// 닫힌 범위 연산자(Closed Range Operator)
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
} 
// 1 times 5 is 5
// 2 times 5 is 10
// 3 times 5 is 15
// 4 times 5 is 20
// 5 times 5 is 25

// 반 열림 범위 연산자(Half-Open Range Operator)
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}

// 단방향 범위 연산자(One-Sided Ranges Operator)
for name in names[2...] { // 2번째 요소부터 끝까지
    print(name)
}
// Brian
// Jack

for name in names[...2] { // 처음부터 2번째 요소까지
    print(name)
}
// Anna
// Alex
// Brian


let range = ...5 // -infinity...5
range.contains(7) // false
range.contains(4) // true
range.contains(-1) // true




