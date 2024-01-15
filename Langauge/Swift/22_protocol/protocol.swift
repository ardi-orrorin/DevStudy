// 프로토콜
// 자바에서 인터페이스와 비슷한 역할을 하는 추상 타입
// 프로토콜 구문
protocol SomeProtoccol {

}


// 프로퍼티 요구사항
/*
    요구된 프로퍼티 이름과 타입만 지정하고 프로퍼틴이ㅡ 계산된 프로퍼티 인지에 대한 지정은 하지 않습니다.
    프로토콜은 각 프로퍼티가 gettable인지 gettable과 settable인지 지정해야 한다.
*/

protocol SomProtocol {
    var mustBeSettable: Int { get set}
    var doesNotNeedToBeSettable: Int { get }
}

// 타입 프로퍼티 요구사항

protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}

// 단일 인스턴스 프로퍼티 요구사항
protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String

    // func setFullName(name: String) {
    //     self.fullName = name
    // }
}

var john = Person(fullName: "John Appleseed")
print("Person's full name is \(john.fullName)")
john.fullName = "Johnson"
print("Person's full name is \(john.fullName)")
// john.setFullName(name: "String")
// print("Person's full name is \(john.fullName)")


// struct Starship: FullyNamed {
    // protocol requires property 'fullName' with type 'String'; do you want to add a stub?
// }
// let ncc1701 = Starship()
// print("Starship's full name is \(ncc1701)")


// 메서드 요구사항
protocol RandomNumberGenerator { 
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 1234.0
    let a = 1234.0
    let c = 1234.0

    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy: m))
        return lastRandom / m
    }
}


// mutating 메서드 요구사항

protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on

    mutating func toggle() {
        switch self {
        case .off:
            self = .on

        case .on:
            self = .off
        }
    }
}

var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()

// 초기화 구문 요구사항
protocol SomeProtocol {
    init(someParameter: Int)
}

// 클래스 타입에서 초기화 구문 요구사항 구현
class SomeClass: SomeProtocol {
    
    // required 키워드를 붙여주어야 한다.
    required init(someParameter: Int) {
        // 구현 내용
    }
}

// 하위 클래스가 상위 클래스와 프로토콜의 초기화 구문을 구현하려면 required override 키워드를 붙여주어야 한다.
protocol SomeProtocol2 {
    init()
}

class SomSuperClass {
    init() {
        // 초기화 구문 구현 내용
    }
}

class SomSubClass: SomSuperClass, SomeProtocol2 {
    required override init() {}
}

// 프로토콜 타입
protocol DiceGame {
    var dice: Dice { get }
    func play()
}

protocol DiceGameDelegate: AnyObject {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)

    func gameDidEnd(_ game: DiceGame)
}

class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    weak var delegate: DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
}

class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            print("Started a new game of Snakes and Ladders")
        }
        print("The game is using a \(game.dice.sides)-sided dice")
    }
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }
    func gameDidEnd(_ game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns")
    }
}

let tracker = DiceGameTracker()
let game = SnakesAndLadders()
game.delegate = tracker
game.play()
// Started a new game of Snakes and Ladders
// The game is using a 6-sided dice
// Rolled a 3
// Rolled a 5
// Rolled a 4
// Rolled a 5
// The game lasted for 4 turns


// 프로토콜 확장
protocol TextRepresentable {
    var textualDescription: String { get }
}


extension Dice23: TextRepresentable {
    var textualDescription: String {
        return "A \(sides)-sided dice"
    }
}

let d12 = Dice23(sides: 12, generator: LinearCongruentialGenerator())
print(d12.textualDescription)



// 프로토콜 준수 확인
extension Array: TextRepresentable where Element: TextRepresentable {
    var textualDescription: String {
        let itemsAsText = self.map { $0.textualDescription }
        return "[" + itemsAsText.joined(separator: ", ") + "]"
    }
}
let myDice = [d12, d12]
print(myDice.textualDescription)


// 합성된 구현을 사용하여 프로토콜 채택

struct Vector3D: Equatable {
    var x = 0.0, y = 0.0, z = 0.0   
}

let twoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
let anotherTwoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)

if twoThreeFour == anotherTwoThreeFour {
    print("These two vectors are also equivalent.")
}

enum SkillLevel: Comparable {
    case beginener
    case inttermediate
    case expert(stars: Int)
}

var levels = [SkillLevel.inttermediate, SkillLevel.beginener, SkillLevel.expert(stars: 5), SkillLevel.expert(stars: 3)]
for level in levels.sorted() {
    print(level)
}

// 클래스 전용 프로토콜
// AnyObject 프로토콜을 상속 받아서 클래스 타입으로 제한 할 수 있다.
protocol SomeClassOnlyProtocol: AnyObject {
    // class-only protocol definition goes here
}

// 프로토콜 혼합
// &을 써서 여러 프로토콜을 혼합하여 사용할 수 있다.
protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct Person2: Named, Aged {
    var name: String
    var age: Int
}

func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
}

let birthdayPerson = Person2(name: "Malcolm", age: 21)  
wishHappyBirthday(to: birthdayPerson)

// 클래스와 혼합
class Location {
    var latitude: Double
    var longitude: Double

    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

class City: Location, Named {
    var name: String

    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        super.init(latitude: latitude, longitude: longitude)
    }
}

func beginConcert(in location: Location & Named) {
    print("Hello, \(location.name)")
}

let seoul = City(name: "Seoul", latitude: 37.123, longitude: 127.123)
beginConcert(in: seoul)

// 프로토콜 준수에 대한 검사

protocol HasArea {
    var area: Double { get }
}

class Circle: HasArea {
    let pi = 3.141592
    var radius: Double
    var area: Double { return pi * radius * radius }

    init(radius: Double) { self.radius = radius }
}  

class Country: HasArea {
    var area: Double

    init(area: Double) { self.area = area }
}

class Animal {
    var legs: Int

    init(legs: Int) { self.legs = legs }
}

let objects: [AnyObject] = [
    Circle(radius: 2.0),
    Country(area: 243_610),
    Animal(legs: 4)
]

for object in objects {
    if let objectWithArea = object as? HasArea {
        print("Area is \(objectWithArea.area)")
    } else {
        print("Something that doesn't have an area")
    }
}

// 옵셔널 프로토콜 요구사항
@objc protocol CounterDataSource {
    @objc optional func increment(forCount count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}