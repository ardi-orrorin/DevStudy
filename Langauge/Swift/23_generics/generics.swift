// 제네릭


func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}

var someInt = 3
var anotherInt = 107

swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")


// 제네릭 함수

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}

var someInt2 = 3
var anotherInt2 = 107
swapTwoValues(&someInt2, &anotherInt2)
print("someInt is now \(someInt2), and anotherInt is now \(anotherInt2)")

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)
print("someString is now \(someString), and anotherString is now \(anotherString)")

struct Stack<T> {
    var items: [T] = []
    mutating func push(_ item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")
print("stackOfStrings is now \(stackOfStrings.items)")

// 제너릭 타입 확장
extension Stack {
    var topItem: T? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

print("topItem is now \(stackOfStrings.topItem)")


// 타입 제약
func findIndex<T: Equatable>(of valueToFind: T, in array: [T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind { return index }
    }
    return nil
}

let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25])
print("doubleIndex is now \(doubleIndex?.description)")
let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"])
print("stringIndex is now \(stringIndex?.description)")


// 연관 타입
protocol Container {
    associatedtype Item // 연관 타입 선언
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

struct Con<T>: Container {
    var items: [T] = []
    mutating func append(_ item: T) {
        self.push(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
    mutating func push(_ item: T) {
        items.append(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> T {
        return items[i]
    }
}

// 연관된 타입 제약조건

protocol SuffixableContainer: Container {
    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
    func suffix(_ size: Int) -> Suffix
}