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


// 함수와 클로저
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
print(greet(person: "Bob", day: "Tuesday")) // Hello Bob, today is Tuesday.

// 파라미터 이름을 생략할 수 있다.
// 파라미터 이름을 생략하면 _ 를 사용한다.
func greet2(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}

print(greet2("Test", on: "test"))

// 튜플을 사용하여 여러개의 값을 리턴할 수 있다.
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        print(score)
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}

// 튜플의 요소 번호로 접근할 수도 있다.
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics) // (3, 100, 120)
print(statistics.sum) // 120
print(statistics.2) // 120
print(statistics.min) // 3
print(statistics.0) // 3
print(statistics.max) // 100
print(statistics.1) // 100

// 함수는 중첩될 수 있다.
func returnFifteen() -> Int {
    var y = 10
    func add() { // 함수 안에 함수를 정의할 수 있다.
        y += 5
    }
    add()
    return y
}
print(returnFifteen()) // 15

// 함수는 파라미터로 함수를 받을 수 있다.
// 합수는 1급 타입으로 함수가 다른 함수를 반환할 수 있다.

func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}

var increment = makeIncrementer();
print(increment(7)) // 8

// 함수는 다른 함수를 파라미터로 받을 수 있다.
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            print("\(item) = true")
            return true
        }
    }
    print("\(list) = false")
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 15
}

var numbers = [20, 19, 7, 12]
print(hasAnyMatches(list: numbers, condition: lessThanTen)) // true


var numbers = [20, 19, 7, 12]
numbers.map({ (nummber: Int) -> Int in  // Int in 은 파라미터와 리턴 타입을 구분하는 키워드
    let result = 3 * nummber
    print("result = \(result)")
    return result
})

// 파라미터 타입과 리턴 타입을 생략할 수 있다.
// 클로저의 타입을 이미 알고 있다면 파라미터의 타입 반환 타입을 생략할 수 있다.
var numbers = [20, 19, 7, 12]
let mapNumbers = numbers.map({ number in 3 * number })

// 변수 이름 대신 $0, $1, $2 등을 사용할 수 있다.
var numbers = [20, 19, 7, 12]
let mapNumbers = numbers.sorted { $0 > $1 }
print(mapNumbers) // [20, 19, 12, 7]


// class 와 객체
class Shape {
    var numberIfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberIfSides) sides."
    }
}

var shape = Shape()
shape.numberIfSides = 7
var shapeDescription = shape.simpleDescription()
print(shapeDescription) // A shape with 7 sides.
print(shape.simpleDescription()) // A shape with 7 sides.

// 클래스는 생성자를 가질 수 있다.
// 생성자는 init 으로 정의한다.
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) { // 생성자
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

// 클래스는 상속할 수 있다.
class Shape: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength // self 는 자기 자신을 가리킨다.
        super.init(name: name) // 부모 클래스의 생성자를 호출한다.
        numberOfSides = 4
    }

    func area() -> Double {
        return sideLength * sideLength
    }

    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }    
}

let test = Shape(sideLength: 5.2, name: "my test square")
print(test.area()) // 27.040000000000003
print(test.simpleDescription()) // A square with sides of length 5.2.

// 클래스는 getter, setter 를 가질 수 있다.
class EquilTriangle: NamedShape {
    var sideLength: Double = 0.0

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }

    var perimeter: Double {
        get { // getter
            return 3.0 * sideLength
        }
        set { // setter
            sideLength = newValue / 3.0
        }
    }

    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}

var triangle = EquilTriangle(sideLength: 3.1, name: "a triangle")   
print(triangle.perimeter) // 9.3

triangle.perimeter = 9.9
print(triangle.perimeter) // 9.9
print(triangle.sideLength) // 3.3000000000000003

// 클래스는 willSet, didSet 을 가질 수 있다.
// willSet 은 값이 변경되기 직전에 호출된다.
// didSet 은 값이 변경된 직후에 호출된다.
class TriangleAndSquare {
    var triangle: EquilTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }

    var square: Shape {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }

    init(size: Double, name: String) {
        square = Shape(sideLength: size, name: name)
        triangle = EquilTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength) // 10.0