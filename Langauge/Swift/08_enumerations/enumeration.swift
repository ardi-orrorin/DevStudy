// 열거형 타입

enum SomeEnumeration {
    // 열거형 정의
}

// 열거형 목록은 case 키워드를 통해 정의한다.
enum CompassPoint {
    case north
    case south
    case east
    case west
}

// 한 줄로도 표기 가능하다.
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var directionToHead = CompassPoint.west
print(directionToHead) // west

// 타입 추론이 된다면 열거형 타입을 명시하지 않아도 된다.
directionToHead = .east
var directionToHead2: CompassPoint = .north

// 스위치 구문에서 열거형 값 일치
directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}

// 열거형 케이스 반복
// 열거형의 모든 케이스를 반복하고 싶다면 CaseIterable 상속받는다.
enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")

for beverage in Beverage.allCases {
    print(beverage)
}

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

// 연관된 값 
// 열거형 케이스에 연관된 값을 저장할 수 있다.

var productBarcode = Barcode.upc(8, 85909, 51226, 3)
print(productBarcode) // upc(8, 85909, 51226, 3)

productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
print(productBarcode) // qrCode("ABCDEFGHIJKLMNOP")

// switch 구문에서 연관된 값을 바인딩하여 사용할 수 있다.

switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
case .qrCode(let productCode):
    print("QR code: \(productCode)")
}


// 원시값
// 열거형 케이스에 원시값을 할당할 수 있다.
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

let tab = ASCIIControlCharacter.tab.rawValue
print(tab) // \t

enum Planet2: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let earthsOrder = Planet2.earth.rawValue
print(earthsOrder) // 3


enum CompassPoint2: String {
    case north, south, east, west
}

let sunsetDirection = CompassPoint2.west.rawValue
print(sunsetDirection) // west

// 원시값 초기화
let possiblePlanet = Planet2(rawValue: 7)

// 원시값이 없는 경우 nil 반환
let positionToFind = 11
if let somePlanet2 = Planet2(rawValue: positionToFind) {
    switch somePlanet2 {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}

// 재귀 열거형
// 열거형 케이스에 하나 이상의 연관된 값으로 열거형의 다른 인스턴스를 갖고 있는 열거형이다.
// 재귀적임을 나타내기 위해 케이스 압ㅍ에 indirect 키워드를 사용한다.

// 사용할 케이스에 대해서만 indirect 키워드를 사용할 수 있다.
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

// 혹은 전체 사용할 경우 enum 키워드 앞에 indirect를 사용한다.
indirect enum ArithmeticExpression2 {
    case number(Int)
    case addition(ArithmeticExpression2, ArithmeticExpression2)
    case multiplication(ArithmeticExpression2, ArithmeticExpression2)
}

// 재귀적 열거형의 사용
let five = ArithmeticExpression.number(5) // 5
let four = ArithmeticExpression.number(4) // 4
let sum = ArithmeticExpression.addition(five, four) // 5 + 4
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2)) // (5 + 4) * 2
print("five: \(five)")
print("four: \(four)")
print("sum: \(sum)")
print("product: \(product)")

// 사용예제
func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
        case let .number(value): return value
        case let .addition(left, right): return evaluate(left) + evaluate(right)
        case let .multiplication(left, right): return evaluate(left) * evaluate(right)
    }
}

print("evaluate: \(evaluate(product))")

