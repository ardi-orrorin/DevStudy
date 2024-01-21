// 고급 연산자


// 연산자 메서드
struct Vector2D {
    var x = 0.0, y = 0.0
}

extension Vector2D {
    static func + (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
}

let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anotherVector
print("combinedVector: \(combinedVector)")

// 접두사와 접미사 연산자

extension Vector2D {
    static prefix func - (vector: Vector2D) -> Vector2D {
        return Vector2D(x: -vector.x, y: -vector.y)
    }
}

let positive = Vector2D(x: 3.0, y: 4.0)
let negative = -positive
print("negative: \(negative)")
let alsoPositive = -negative
print("alsoPositive: \(alsoPositive)")

// 복합 할당 연산자
extension Vector2D {
    static func += (left: inout Vector2D, right: Vector2D) {
        left = left + right
    }
}
var original = Vector2D(x: 1.0, y: 2.0)
let vectorToAdd = Vector2D(x: 3.0, y: 4.0)
original += vectorToAdd
print("original: \(original)")

// 등가 연산자
/*
    기본적으로 사용자 정의 클래스와 구조체는 같음 연산자(==)와 다름 연산자(!=)를 갖고 있지 않다
    Swift의 Equatble 프로토콜을 추가해서 구현 할 수 있다
*/

extension Vector2D: Equatable {
    static func == (left: Vector2D, right: Vector2D) -> Bool {
        return (left.x == right.x) && (left.y == right.y)
    }
}

let twoThree = Vector2D(x: 2.0, y: 3.0)
let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)
if twoThree == anotherTwoThree {
    print("These two vectors are equivalent.")
}

// 사용자 정의 연산자(Custom Operators)
prefix operator +++ // 접두사형 사용자 정의 연산자 정의
extension Vector2D {
    static prefix func +++ (vector: inout Vector2D) -> Vector2D {
        vector += vector
        return vector
    }
}

var toBeDoubled = Vector2D(x: 1.0, y: 4.0)
print("toBeDoubled: \(toBeDoubled)")
let afterDoubling = +++toBeDoubled

print("afterDoubling: \(afterDoubling)")


