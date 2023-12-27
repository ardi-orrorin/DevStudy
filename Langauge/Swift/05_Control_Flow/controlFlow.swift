// Control Flow
/*

*/

// For-In Loops
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}
// Hello, Anna!
// Hello, Alex!
// Hello, Brian!
// Hello, Jack!

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

// Range
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}   

let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
    print(answer)
}
print("\(base) to the power of \(power) is \(answer)")

let minutes = 60
for tickMark in 0..<minutes {
    print(tickMark)
}

let minuteInterval = 5
// stride(from:to:by:) 사용하여 닫힘 범위 사용 가능
for tickMark in stride(from: 0, through: minutes, by: minuteInterval) {
    print(tickMark)
}

let hours = 12
let houtInterval = 3
for tickMark in stride(from: 3, through: hours, by: houtInterval) {
    print(tickMark)
}

// While Loops
let finalSquare = 10
var board = [Int](repeating: 1, count: finalSquare + 1)
print("board: \(board)")
var count = 0;
while board.count > count {
    print("board[\(count)]: \(board[count])")
    count += 1
}
// repeat-while
// do-while과 같은 역할
// while은 조건에 맞을 경우 실행된다면 repeat은 최소 한 번은 실행 후 조건을에 맞는지 확인한다.
count = 0
repeat {
    print("board[\(count)]: \(board[count])")
    count += 1
} while board.count > count

// Conditional Statements
// if
var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
}
// if-else
temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}

// if-else if-else
temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}

// 값 바인딩
var lettemp = 1
let freezeWarning: String? = if lettemp <= 0 {
    "The water is frozen."
} else {
    nil
}
print("freezeWarning: \(freezeWarning)")

var lettemp = 1
let freezeWarning = if lettemp <= 0 {
    "The water is frozen."
} else {
    nil as String? // 타입 명시
}
print("freezeWarning: \(freezeWarning)")


// switch
let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}

// interval matching
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount: String = ""
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}

print("There are \(naturalCount) \(countedThings).")

// tuple
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("(0, 0) is at the origin")
case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
    print("(0, \(somePoint.1)) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}

// value binding
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with an y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}

// where
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}

// compound cases 합성 케이스
let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l",
     "m", "n", "p", "q", "r", "s", "t", "v", "w",
     "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}


// Control Transfer Statements (제어 변경 구문)
// continue (다음 반복으로 넘어감), 루프를 벗어나지 않고 현재 루프를 완료 했다는 의미
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
for character in puzzleInput {
    if charactersToRemove.contains(character) {
        continue // 다음 반복으로 넘어감
    }
    puzzleOutput.append(character)
}
// charactersToRemove 배열에 포함된 문자들이 아닌 문자들만 puzzleOutput에 추가
print(puzzleOutput) // grtmndsthnklk

// break (루프를 종료하거나 switch문을 종료)
let numberSymbol: Character = "三"  // 중국어 숫자 3
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑": // 1
    possibleIntegerValue = 1
case "2", "٢", "二", "๒": // 2
    possibleIntegerValue = 2
case "3", "٣", "三", "๓": // 3
    possibleIntegerValue = 3
case "4", "٤", "四", "๔": // 4
    possibleIntegerValue = 4
default:
    break // switch문 종료
}

if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value could not be found for \(numberSymbol).") // An integer value could not be found for 三.
}

// fallthrough (switch문에서만 사용 가능)
// swift에서 switch문은 기본적으로 break가 포함되어 있어서 case가 실행되면 switch문을 종료한다.
// fallthrough를 사용하면 break를 사용하지 않고 다음 case를 실행한다.

let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19: // 소수
    description += " a prime number, and also"
    fallthrough // 다음 case 실행
default:
    description += " an integer."
}
print(description) // The number 5 is a prime number, and also an integer.

// label statement
// 반복문이나 switch문에 이름을 붙여서 사용
// break, continue, fallthrough, return 구문에 사용 가능
// 이름 뒤에 콜론(:)을 붙여서 사용

let finalSquare = 10
var square = 0
loop: while square != finalSquare {
    print("square: \(square)")
    for item in 1...6 {
        if item < 5 {
            print("item: \(item)")
            continue
        } else if square == 5 {
            break loop
        } else {
            print("default: \(item)")
        }
    }
    square += 1
}

// Early Exit (조기 종료)
// guard문을 사용하여 조건에 맞지 않으면 빠르게 종료
// guard문은 조건이 참이 되지 않을 경우만 else 블록을 실행하고 종료


func greet(person: [String: String]) {
    guard let name = person["name"] else { 
        return 
    }
    print("Hello \(name)!")

    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return 
    }
    print("I hope the weather is nice in \(location).")
}

greet(person: ["name": "John"])
// Hello John!
// I hope the weather is nice near you.

greet(person: ["location": "Cupertino"])


// defered statements
// defer 구문은 코드 블록이 종료되기 전에 반드시 실행되어야 하는 코드를 작성할 때 사용

var score = 1
if score < 10 {
    defer {
        print("defer: \(score)")
    }
    score += 3
}

var score = 1
if score < 10 {
    score += 10
    defer {
        print("defer1: \(score)")
    }
    defer {
        score -= 10
        print("defer2: \(score)")
    }
    defer {
        print("defer3: \(score)")
    }
    
    print("score: \(score)")
}
// defer는 역순으로 실행된다.

// Chekcing API Availability (API의 가용성 확인)
@available(iOS 10, macOS 10.12, *) // iOS 10, macOS 10.12 이상에서 사용 가능
struct ColorPreference {
    // iOS 10, macOS 10.12 이상에서 사용 가능
    var bestColor = "blue"
}

func chooseBestColor() -> String {
    guard #available(macOS 10.12, *) else { // macOS 10.12 이사이 아니면 gray 문자열 반환
        return "gray"
    }
    let colors = ColorPreference()
    return colors.bestColor
}



