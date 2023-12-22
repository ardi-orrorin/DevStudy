print("Hello, World!")


// 변수 선언
// var 변수
// let 상수
var myVariable = 42
print(myVariable)
print("myVariable = \(myVariable)")
myVariable = 50
print(myVariable)
print("myVariable = \(myVariable)")

// int to double error

var myInteger = 10
print(myInteger)
// myInteger = 20.1
// print(myInteger) // error: cannot assign value of type 'Double' to type 'Int'

// double type
var myDouble = 20.1
print(myDouble)
myDouble = 10
print(myDouble) // 10.0

// 형 변환
let label = "The width is "
let width = 94
// let widthLabel = label + width // overloads for '+' exist with these partially matching parameter lists: (Int, Int), (String, String)
let widthLabel = label + String(width)
print(widthLabel)


//문자열 보간법
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples + oranges) apples."
print(appleSummary)

// 배열
var shoppingList = ["catfish", "water", "tulips", "blue paint"]
print(shoppingList)
shoppingList[1] = "bottle of water"
print(shoppingList)
shoppingList.append("toothpaste")
print(shoppingList)

// 빈배열 혹은 딕셔너리 생성
// 빈 배열 생성시 타입을 명시해야함
let emptyArray: [String] = []
let emptyDictionary: [String: String] = [:]

// 제어 흘므 Control Flow
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
print(individualScores)
for score in individualScores {
    print(score)
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print("teamScore = \(teamScore)")

// = 뒤에 조건문을 쓸 수 있다.
let scoreDecoration = if teamScore > 50 {
    "good"
} else {
    "bad"
}
print("scoreDecoration = \(scoreDecoration)")

// 옵셔널 값
var optionalString: String? = "Hello"
print(optionalString == nil) // false

let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)"
print(informalGreeting) // Hi John Appleseed

if let nickName {
    print("nickName = \(nickName)")
    
}

// switch
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress": // , 로 여러개를 나열할 수 있다.
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"): // where 로 조건을 추가할 수 있다.
    print("Is it a spicy \(x)?")
default: // 없으면 에러가 난다.
    print("Everything tastes good in soup.")
}

// while
var n = 2
while n < 100 {
    n = n * 2
}
print(n) // 128

var m = 2
repeat { // do while
    m = m * 2
} while m < 100

// for in
var total = 0
for i in 0..<4 { // ..< 는 마지막 숫자를 포함하지 않는다.
    total += i
}
print(total) // 6