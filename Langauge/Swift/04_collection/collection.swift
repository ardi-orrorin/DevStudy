// Collection
/* 
    1. Array [1,2,3,4,5] 
    2. Set {1,2,3,4,5}
    3. Dictionary {key:value, key:value}

    Swift에서는 3가지 타입의 Collection을 제공한다.
*/

// 배열
// 빈 배열
var someInts: [Int] = []
print("someInts is of type [Int] with \(someInts.count) items.") // someInts is of type [Int] with 0 items.
someInts.append(3) 
print("someInts is of type [Int] with \(someInts.count) items.") // someInts is of type [Int] with 1 items.
someInts = []
print("someInts is of type [Int] with \(someInts.count) items.") // someInts is of type [Int] with 0 items.


// 기본값 배열 생성
// repeating: 기본값, count: 배열의 크기
var threeDoubles = Array(repeating: 0.0, count: 3)
print(threeDoubles) // [0.0, 0.0, 0.0]

// 두 배열 합치기
// 동등한 타입의 2개의 배열을 + 연산자를 통해 새로운 배영을 생성할 수  있다.
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles
print(sixDoubles) // [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]

// 배열 리터럴
var shoppingList: [String] = ["Eggs", "Milk"]
print(shoppingList) // ["Eggs", "Milk"]
print(shoppingList.count) // 2
if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
} // The shopping list is not empty.

shoppingList.append("Flour")
print(shoppingList) // ["Eggs", "Milk", "Flour"]



shoppingList += ["Baking Powder"]
print(shoppingList) // ["Eggs", "Milk", "Flour", "Baking Powder"]

print("shoppingList.hashValue : \(shoppingList.hashValue)") // shoppingList.hashValue : 0

shoppingList += ["Chocolate Spread", "Cheese", "Butter"] // 새 배열 생성해서 할당한다.
print("shoppingList.hashValue : \(shoppingList.hashValue)") 

print(shoppingList) // ["Eggs", "Milk", "Flour", "Baking Powder", "Chocolate Spread", "Cheese", "Butter"]

print("shoppingList[4...6] : \(shoppingList[4...6])") // shoppingList[4...6] : ["Chocolate Spread", "Cheese", "Butter"]

// insert(_:at:) : 특정 위치에 삽입
shoppingList.insert("insert", at: 0)
print(shoppingList) // ["insert", "Eggs", "Milk", "Flour", "Baking Powder", "Chocolate Spread", "Cheese", "Butter"]

// remove(at:) : 특정 위치의 요소를 삭제
shoppingList.remove(at: 0)
print(shoppingList) // ["Eggs", "Milk", "Flour", "Baking Powder", "Chocolate Spread", "Cheese", "Butter"]
shoppingList.remove(at: 2)
print(shoppingList) // ["Eggs", "Milk", "Baking Powder", "Chocolate Spread", "Cheese", "Butter"]

// 배열 순회
for item in shoppingList {
    print(item)
}

// 배열 인덱스와 값 순회
for (index, value) in shoppingList.enumerated() {
    print("Item \(String(index + 1)): \(value)")
}

// Set
// Set는 동일한 타입의 값이 중복되지 않고 순서가 없는 컬렉션 타입이다.

var favorigteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
print(favorigteGenres) // ["Rock", "Classical", "Hip hop"]
favorigteGenres.insert("Jazz")
favorigteGenres.insert("Rock")
print(favorigteGenres) // ["Rock", "Classical", "Jazz", "Hip hop"]

if let removedGenre = favorigteGenres.remove("Rock") { // remove는 삭제한 요소를 반환한다. 삭제한 요소가 없으면 nil을 반환한다.
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
} // Rock? I'm over it.

// contains(_:) : 특정 요소가 존재하는지 확인
if favorigteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
} // It's too funky in here.

// Set 순회
for genre in favorigteGenres {
    print("\(genre)")
}
// Classical
// Jazz
// Hip hop


// set 타입은 정의된 순서를 가지고 있지 않지만 특정 순서대로 순회하고 싶다면 sorted() 메서드를 사용한다.
for genre in favorigteGenres.sorted() {
    print("\(genre)")
}
// Classical
// Hip hop
// Jazz

// 집합 연산
// intersection(_:) : 교집합
// symmetricDifference(_:) : 여집합
// union(_:) : 합집합
// subtracting(_:) : 차집합

let oddDigits: Set = [1,3,5,7,9]
let evenDigits: Set = [0,2,4,6,8]
let singleDigitPrimeNumbers: Set = [2,3,5,7]

print(oddDigits.union(evenDigits).sorted()) // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
print(oddDigits.intersection(evenDigits).sorted()) // []
print(oddDigits.intersection(singleDigitPrimeNumbers).sorted()) // [3, 5, 7]
print(oddDigits.subtracting(singleDigitPrimeNumbers).sorted()) // [1, 9]
print(oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()) // [1, 2, 9]

// 집합 멤버십과 동등 비교
// isSubset(of:) : 부분집합
// isSuperset(of:) : 상위집합
// isStrictSubset(of:) : 진부분집합
// isDisjoint(with:) : 교집합이 없는지 확인


let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals) // true
farmAnimals.isSuperset(of: houseAnimals) // true
farmAnimals.isSuperset(of: cityAnimals) // false
farmAnimals.isDisjoint(with: cityAnimals) // true

// 딕셔너리
var namesOfIntegers = [Int: String]()
namesOfIntegers[16] = "sixteen"
print(namesOfIntegers) // [16: "sixteen"]
namesOfIntegers = [:] 
print(namesOfIntegers) // [:]

// 딕셔너리 리터럴
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
print(airports) // ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
print(airports["YYZ"]) // Optional("Toronto Pearson")

print(airports.count) // 2

// addValue
airports["LHR"] = "London"
print(airports) // ["YYZ": "Toronto Pearson", "DUB": "Dublin", "LHR": "London"]
airports["LHR"] = "London Heathrow"
print(airports) // ["YYZ": "Toronto Pearson", "DUB": "Dublin", "LHR": "London Heathrow"]
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") { // updateValue는 업데이트 전의 값을 반환한다.
    print("The old value for DUB was \(oldValue).") // The old value for DUB was Dublin.
}
if let airportName = airports["DUB"] { // 딕셔너리에서 해당 키의 값을 반환
    print("The name of the airport is \(airportName).") // The name of the airport is Dublin Airport.
} else {
    print("That airport is not in the airports dictionary.")
}

// nil을 통해 해당 키와 값을 삭제 할 수 있다.
airports["APL"] = "Apple International"
print(airports) // ["APL": "Apple International", "YYZ": "Toronto Pearson", "DUB": "Dublin", "LHR": "London Heathrow"]
airports["APL"] = nil
print(airports) // ["YYZ": "Toronto Pearson", "DUB": "Dublin", "LHR": "London Heathrow"]

// removeValue(forKey:) : 삭제한 값을 반환한다.
if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).") // The removed airport's name is Dublin.
} else {
    print("The airports dictionary does not contain a value for DUB.")
}

// 순회
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}
// YYZ: Toronto Pearson
// LHR: London Heathrow

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}
// Airport code: YYZ
// Airport code: LHR

for airportName in airports.values {
    print("Airport name: \(airportName)")
}
// Airport name: Toronto Pearson
// Airport name: London Heathrow

// 딕셔너리의 키와 값을 배열로 변환
let airportCodes = [String](airports.keys)
print(airportCodes) // ["YYZ", "LHR"]
let airportNames = [String](airports.values)
print(airportNames) // ["Toronto Pearson", "London Heathrow"]
