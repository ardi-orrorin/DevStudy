// 메서드 특정 타이과 연관된 함수

// 인스턴스 메서드
class Counter {
    var count = 0
    func increment(){
        count += 1
    }

    func increament(by amount: Int) {
        count += amount
    }

    func reset(){
        count = 0
    }
}

let counter = Counter()
counter.increment()
print(counter.count) // 1
counter.increament(by: 5)
print(counter.count) // 6
counter.reset()
print(counter.count) // 0

// self 프로퍼티
// 인스턴스 그자체를 가르키는 프로퍼티
// 염시적으로 작성하지 않아도 자동으로 인식한다.
// 하지만, 인스턴스 메서드 내에서 프로퍼티와 메서드의 이름이 같을 경우
// 메서드의 프로퍼티가 우선순위를 가지므로, self를 명시적으로 사용해야 한다.

// func increment(){
//     self.count += 1
// }

struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool{
        return self.x > x
    }
}

let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
}

// mutating 메서드
// 구조체와 열거형은 값 타입이므로, 인스턴스 메서드 내에서 프로퍼티 값을 변경하려면
// mutating 키워드를 사용해야 한다.

struct Point2 {
    var x = 0.0, y = 0.0
    func moveBy(x deltaX: Double, y deltaY: Double){
        x += deltaX
        y += deltaY
    }
}

var somePoint2 = Point2(x: 1.0, y: 1.0)
somePoint2.moveBy(x: 2.0, y: 3.0) // error
print("The point is now at (\(somePoint2.x), \(somePoint2.y))")

struct Point3 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double){
        x += deltaX
        y += deltaY
    }
}

var somePoint3 = Point3(x: 1.0, y: 1.0)
somePoint3.moveBy(x: 2.0, y: 3.0) 
print("The point is now at (\(somePoint3.x), \(somePoint3.y))") // The point is now at (3.0, 4.0)

// 변경 메스드 내에서 self 할당
struct Point4 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double){
        self = Point4(x: x + deltaX, y: y + deltaY)
    }
}

// 열거형 변경 메서드는 동일한 열거형에 다른 케이스로 self 파리머터를 설정할 수 있다.

enum TriStateSwitch {
    case off, low, high
    mutating func next(){
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

var ovenLight = TriStateSwitch.low
ovenLight.next() // high
print("ovenLight is \(ovenLight)")
ovenLight.next() // off
print("ovenLight is \(ovenLight)")

// 타입 메서드
// 메서드는 특정 타입의 인스턴으세서 호출되는 함수지만, 타입 자체에서 호출되는 메서도도 정의 할 수 있다.
// 타입 메서드 내에서는 암시적으로 self 프로퍼티는 인스턴스가 아닌 타입 그 자체를 참조한다.
class SomeClass {
    class func someTypeMethod(){
        print("Type method")
    }
}

SomeClass.someTypeMethod() // Type method

struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1

    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }

    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    @discardableResult
    mutating func adbance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int){

        LevelTracker.unlock(level + 1)
        tracker.adbance(to: level + 1)
    }

    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Argyrios")
player.complete(level: 1)
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)") // 2

player = Player(name: "Beto")
if player.tracker.adbance(to: 6) {
    print("player is now on level 6")
} else {
    print("level 6 has not yet been unlocked") // level 6 has not yet been unlocked
}
