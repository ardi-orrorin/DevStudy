// 자동 참조 카운팅(Automatic Reference Counting)

/*
    swift는 앱의 메모리 사용량을 추척하고 관리하기 위해 자동 참조 카운팅을 사용한다.
    arc는 인스턴스가 더이상 필요하지 않을 때 자동으로 클래스 인스턴스에 의해 사용된 메모리를 반환한다.
    참조 카운팅은 클래스의 인스턴스에만 적용된다.
    구조체와 열거형은 참조 타입이 아니고 값 타입이고 참조로 저장되거나 전달되지 않는다.
*/


// ARC 동작
class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }

    deinit {
        print("\(name) is being deinitialized")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "John Appleseed")
reference2 = reference1
reference3 = reference1

reference1 = nil
print("\(reference2!.name)")
reference2 = nil
print("\(reference3!.name)")
reference3 = nil

// 클래스 인스턴스 사이으 가한 참조 사이클

class Person {
    let name: String
    init(name: String) {
        self.name = name
    }
    var apratment: Apartment?
    deinit{
        print("\(name) is being deinitialized")
    }
}

class Apartment {
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    var tenant: Person?
    deinit{
        print("Apartment \(unit) is being deinitialized")
    }
}

var john: Person?
var unit4A: Apartment?

john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "6A")


// 서로 강한 참조 사이클을 생성한다.
john!.apratment = unit4A
unit4A!.tenant = john

john = nil
unit4A = nil

// 약한 참조
// 변수 선언 전에 weak 키워드르 위치시켜 약한 참조를 나타낸다.
// 약한 참조는 nil로 변경하는 것을 허락해야 하므로 항상 옵셔널 타입의 상소가 아닌 변수로 선언된다.

class Person {
    let name: String
    init(name: String) {
        self.name = name
    }
    weak var apratment: Apartment?
    deinit{
        print("\(name) is being deinitialized")
    }
}

class Apartment {
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    weak var tenant: Person?
    deinit{
        print("Apartment \(unit) is being deinitialized")
    }
}

var john: Person?
var unit4A: Apartment?

john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")

john!.apratment = unit4A
unit4A!.tenant = john

john = nil
unit4A = nil

// 미소유 참조(Unowned References)
/*
    약한 참조와 마찬가지로 미소유 참조는 인스턴스를 강하게 유지 하지 않는다.
    그러나 약한 참조와 다르게 미소유 참조는 다른 인스턴스의 수명이 같거나 더 긴 경우에 사용된다.
    unowned 키워드를 위치 시켜 미소유 참조를 나타낸다.

    약한 참조와 달리 미소유 참조는 항상 값을 갖도록 예상한다.
    그래서 비옵셔널에 nil값을 할당하지 못 한다.

    참조가 항상 할당 해제되지 않은 인스턴를 참조한다고 확신할 수 있는 경우에만 미소유 참조를 사용한다.
*/

class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit {
        print("Card #\(number) is being deinitialized")
    }
}

var john: Customer?
john = Customer(name: "John Appleseed1212")
john!.card = CreditCard(number: 1234_5678_9012_3456, customer: john!)

john = nil

// 미소유 참조와 암시적 추출 옵셔널 프로퍼티
/*
    반대로 절대로 프로퍼티에 항상 값이 있고, 초기화가 완료되면 nil이 되어서는 안될 경우가 있다.
*/

class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }

}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}

var country = Country(name: "Canada", capitalName: "Ottawa")
print("\(country.name)'s capital city is called \(country.capitalCity.name)")
