// 불투명한 타입
/*
    값의 타입을 숨기기위한 두가지 방법을 제공
    박스형 프로토콜(boxed protocol)
    불투명한 타입(opaque type)
*/

protocol Shape {
    func draw() -> String
}

struct Triangle: Shape {
    var size: Int
    func draw() -> String {
        var result: [String] = []
        for length in 1...size {
            result.append(String(repeating: "*", count: length))
        }
        return result.joined(separator: "\n")
    }
}

let smallTriangle = Triangle(size: 3)
print(smallTriangle.draw())


// 불투명한 타입 반환(Returning an Opaque Type)
func makeTrapezoid() -> some Shape {
    let top = Triangle(size: 2)
    // let middle = Square(size: 2)s
    return top
}

let trapezoid = makeTrapezoid()
print(trapezoid.draw())


// 박스명 프로토콜 타입(Boxed Protocol Types)

struct VerticalShapes: Shape {
    var shapes: [any Shape]
    func draw() -> String {
        return shapes.map { $0.draw() }.joined(separator: "\n")
    }
}

let largeTriangle = Triangle(size: 10)


let vertical = VerticalShapes(shapes: [largeTriangle])
print(vertical.draw())

/*
    불투명한 타입과 박스형 프로토콜의 타입 차이점
    1. 불투명한 타입은 하나의 특정 타입을 참조하지만 함수 호출자는 어떤 타입인지 알 수 없다.
    2. 박스형 프로토콜은 프로토콜을 준수하는 모든 타입을 참조할 수 있다.

*/