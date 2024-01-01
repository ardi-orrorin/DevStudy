// 저장된 프로퍼티

struct FiexedLengthRagne {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FiexedLengthRagne(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6
print(rangeOfThreeItems.firstValue) // 6
print(rangeOfThreeItems.length) // 3
// rangeOfThreeItems.length = 4 // error 상수 변경 불가 에러

// 지연 저장 프로퍼티
class DataImporter {
    var filename = "data.txt"
}

class DataManager {
    // DataImporter 인스턴스를 생성하기 위해 필요한 시간이 오래 걸린다고 가정한다.
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
print(manager.importer.filename) // data.txt
manager.data.append("Some data")
manager.data.append("Some more data")
print(manager.importer.filename) // data.txt
print(manager.data) // ["Some data", "Some more data"]

// 계산된 프로퍼티
// getter, setter

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, heigth = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.heigth / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.heigth / 2)
        }
    }
}

var square = Rect(origin: Point(x: 1.0, y: 1.0),
                        size: Size(width: 10, heigth: 10))
let initialSquareCenter = square.center
print(square.origin) // Point(x: 1.0, y: 1.0)
print(initialSquareCenter) // Point(x: 5.0, y: 5.0)
square.center = Point(x: 30.0, y: 30.0)
print(square.origin) // Point(x: 25.0, y: 25.0)

// 단축 getter, setter 선언
struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            Point(x: origin.x + (size.width / 2),
                  y: origin.y + (size.heigth / 2))
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.heigth / 2)
        }
    }
}

// 읽기 전용 프로퍼티
struct Cuboid {
    var width = 0.0
    var height = 0.0
    var depth = 0.0
    
    // 읽기 전용 프로퍼티
    var volume: Double {
        return width * height * depth
    }
}

var fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print(fourByFiveByTwo.volume) // 40.0
fourByFiveByTwo.width = 5.0
print(fourByFiveByTwo.volume) // 50.0
// fourByFiveByTwo.volume = 10 // error


// 프로퍼티 감시자
// 프로퍼티의 값이 변경되는지 감시하고, 그에 따른 행동을 정의 핤 윘다.
// willSet : 같이 저장되기 직전에 호출된다.
// didSet : 새로운 값이 저장된 직후에 호출된다.

class StepCount {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("totalSteps will be \(newTotalSteps)")
        }
        didSet {
            print("totalSteps was \(oldValue)")
            if totalSteps > oldValue {
                print("added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCounter = StepCount()
stepCounter.totalSteps = 200
// totalSteps will be 200
// totalSteps was 0
// added 200 steps

stepCounter.totalSteps = 360
// totalSteps will be 360
// totalSteps was 200
// added 160 steps


// 프로퍼티 래퍼
// 프로퍼티가 저장되는 방법을 관리하는 코드와 프로퍼티를 정의 하는 코드 사이에 분리 꼐층을 추가
// 예를 들어 쓰레드 안정성 검사 제공하거나, 
// 데이터베이스에 저장하는 프로퍼티가 있는 경우 모든 프로퍼터에 해당 코드를 작성해야 한다.

@propertyWrapper
struct TwelveOrLess {
    private var number = 0
    var wrappedValue: Int {
        get { self.number }
        set { self.number = min(newValue, 12)}
    }
}

struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}

var rectangle = SmallRectangle()
print(rectangle.height) // 0
rectangle.height = 10
print(rectangle.height) // 10
rectangle.height = 24
print(rectangle.height) // 12

// 프로퍼티 래퍼를 사용하지 않고 구조체 정의
struct SmallRectangle2 {
    private var _height = TwelveOrLess()
    private var _width = TwelveOrLess()
    var height: Int {
        get { _height.wrappedValue}
        set { _height.wrappedValue = newValue}
    }
    var width: Int {
        get { _width.wrappedValue}
        set { _width.wrappedValue = newValue}
    }
}

var rectangle2 = SmallRectangle2()
print(rectangle2.height) // 0
rectangle2.height = 10
print(rectangle2.height) // 10


// 래핑된 프로퍼티 초기값 설정
// 래핑된 프로퍼티는 초기값을 설정할 수 없다.
// 초기값을 설정하기 위해서는 초기화를 진행해줘야 한다.
@propertyWrapper
struct SmallNumber {
    private var maximum: Int
    private var number: Int

    var wrappedValue: Int {
        get { number }
        set { number = min(newValue, maximum) }
    }

    // 3가지 초기화 방법 구현
    init() { // 초기화 진행
        maximum = 12
        number = 0
    }
    init(wrappedValue: Int) { 
        maximum = 12
        number = min(wrappedValue, maximum)
    }
    init(wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}

struct ZeroRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int
}

var zeroRectangle = ZeroRectangle()
print("\(zeroRectangle.height), \(zeroRectangle.width)") // 0, 0

struct NarrowRectangle { 
    @SmallNumber(wrappedValue: 4, maximum: 30) var height: Int
    @SmallNumber(wrappedValue: 1, maximum: 10) var width: Int
}

var narrowRectangle = NarrowRectangle()
print("\(narrowRectangle.height), \(narrowRectangle.width)") // 4, 1
narrowRectangle.height = 100
narrowRectangle.width = 100
print("\(narrowRectangle.height), \(narrowRectangle.width)") // 30, 10

struct MixedRectangle { 
    // wrappedValue는 인수처럼 취급되어 초기값을 설정할 수 있다.
    @SmallNumber var height: Int = -1
    @SmallNumber(maximum: 9) var width: Int = 2
}
var mixedRectangle = MixedRectangle()
print("\(mixedRectangle.height), \(mixedRectangle.width)") // 0, 2
mixedRectangle.height = 100
mixedRectangle.width = 100
print("\(mixedRectangle.height), \(mixedRectangle.width)") // 12, 9


// 값 투영
// 프로퍼티 래퍼는 projected value 정의를 통해 추가적인 기능을 노출할 수 있다.
// $를 붙여서 접근할 수 있다.

@propertyWrapper
struct SmallNumber3 {
    private var number: Int
    private(set) var projectedValue: Bool

    var wrappedValue: Int {
        get { number }
        set {
            if newValue > 12 {
                number = 12 
                projectedValue = true
            } else {
                number = newValue
                projectedValue = false
            }
        }
    }
    init() {
        self.number = 0
        self.projectedValue = false
    }
}

struct SomeStructure {
    @SmallNumber3 var someNumber: Int
}

var somStructure = SomeStructure()
somStructure.someNumber = 4
print(somStructure.someNumber) // 4
print(somStructure.$someNumber) // false
somStructure.someNumber = 55
print(somStructure.$someNumber) // true

enum SizeEnum {
    case small, large
}

struct SizedRectangle {
    @SmallNumber3 var height: Int
    @SmallNumber3 var width: Int

    mutating func resize(to size: SizeEnum) -> Bool {
        switch size {
            case .small:
                height = 10
                width = 20
            case .large:
                height = 100
                width = 100
        }
        return $height || $width
    }
}

var sizedRectangle = SizedRectangle()
print(sizedRectangle.resize(to: .small)) // true
print(sizedRectangle.$height) // false

// 전역과 지역 변수
// 전역 변수와 상수는 Lazy Stored Properties와 유사 방법으로 항상 느리게 계산된다. lazy 키워드를 사용할 필요가 없다.


func somFunction() {
    @SmallNumber3 var someNumber: Int
    print(someNumber) // 0
    someNumber = 10
    print(someNumber) // 10
    print($someNumber) // false

    someNumber = 55
    print(someNumber) // 12
    print($someNumber) // true

}

somFunction()

// 타입 프로퍼티 (Type Properties)
// 이해 안됨..