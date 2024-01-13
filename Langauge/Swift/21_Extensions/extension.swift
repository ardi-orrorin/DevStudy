// Extensions
/*
    기본의 타입에 기능을 추가한다.
    기존의 소스코드에 접근 권한이 없는 타입을 확장하는 기능을 포함한다.
    소급모델링(retroactive modeling)이라고 한다.

    = 수행할 수 있는 작업
    - 계산된 인스턴스 프로퍼티와 계산된 타입 프로퍼티 추가
    - 인스턴스 메서드와 타입 메서드 추가
    - 새로운 초기화자 추가
    - 서브스크립트 정의
    - 새로운 중첨된 타입 정의와 사용
    - 기존 타입에 프로토콜 적용
*/

// 확장 구문
// extension SomeType {
    // 타입에 추가될 새로운 기능 구현
// }

// extension SomeType: SomeProtocol, AnotherProtocol {
    // 프로토콜 요구사항 구현
// }

// 계산된 프로퍼티
extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}
let oneInch = 25.4.mm
print("oneInch: \(oneInch) meters")
let threeFeet = 3.ft
print("threeFeet: \(threeFeet) meters")
let aMarathon = 42.km + 195.m
print("aMarathon: \(aMarathon) meters")

struct Size {
    var width = 0.0, height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    // 기존의 Rect 구조체에 새로운 기능을 추가한다.
    var origin = Point()
    var size = Size()
}

let defaultRect = Rect()
print("defaultRect: \(defaultRect)")
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0),
                          size: Size(width: 5.0, height: 5.0))
print("memberwiseRect: \(memberwiseRect)")


extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2.0)
        let originY = center.y - (size.height / 2.0)
        self.init(origin: Point(x: originX, y: originY),
                  size: size)
    }
}

let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                      size: Size(width: 3.0, height: 3.0))
print("centerRect: \(centerRect)")

// 메서드

extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

3.repetitions {
    print("Hello!")
}
// Hello!
// Hello!
// Hello!


// 인스턴스 메서드 변경(Mutating Instance Methods)
// 화장에서 추가된 인스턴스 메서드는 인스턴스 자체로 수정 또는 뱌녀경할 수 있다.
extension Int {
    mutating func square() {
        self = self * self
    }
}
var someInt = 3
someInt.square()
print("someInt: \(someInt)")


// 서브스크립트
extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

print("746381295[0]: \(746381295[0])")
// 746381295[0]: 5 

print("746381295[1]: \(746381295[1])")
// 746381295[1]: 9

print("746381295[2]: \(746381295[2])")
// 746381295[2]: 2


// 중첩된 타입
extension Int {
    enum Kind {
        case negative, zero, positive
    }

    var kind: Kind {
        switch self {
            case 0:
                return .zero
            case let x where x > 0:
                return .positive
            default:
                return .negative
        }
    }
}

print("1.kind: \(1.kind)")
// 1.kind: positive

print("0.kind: \(0.kind)")
// 0.kind: zero

print("-1.kind: \(-1.kind)")
// -1.kind: negative
