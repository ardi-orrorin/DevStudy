// 옵셔널 체이닝

// swift의 자료형은 기본적으로 nil을 허용하지 않는다.
// 하지만, nil을 허용하고 싶다면 자료형 뒤에 ?를 붙여주면 된다.
// 이렇게 선언된 자료형을 옵셔널 자료형이라고 한다.
// 강제 언래핑을 하기 위해서는 !를 사용한다.


// 옵셔널 체이닝
// class Pserson {
//     var residence: Residence?
// }

// class Residence {
//     var numberOfRooms = 1
// }

// let john = Pserson()
// // let roomcount = john.residence!.numberOfRooms // error
// let roomcount = john.residence?.numberOfRooms
// print("room count is \(roomcount)") // nil

// if let roomCount = john.residence?.numberOfRooms {
//     print("John's residence has \(roomCount) room(s).")
// } else {
//     print("Unable to retrieve the number of rooms.")
// }

// john.residence = Residence()


// if let roomCount = john.residence?.numberOfRooms {
//     print("John's residence has \(roomCount) room(s).")
// } else {
//     print("Unable to retrieve the number of rooms.")
// }

// 옵셔널 체이닝에 대한 모델 클래스 정의
class Person {
    var residence: Residence?
}


class Residence { 
    var rooms: [Room] = []
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        } 
    }

    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }

    var address: Address?

}


class Room {
    let name: String
    init(name: String) { self.name = name }
}


class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?

    func buildingIdentifier() -> String? {
        if let buildingNumber, let street {
            return "\(buildingNumber) \(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
}

// 옵셔널 체이닝을 통한 프로퍼티 접근

let john = Person()
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
} // Unable to retrieve the number of rooms.

let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
john.residence?.address = someAddress // residence가 nil이므로 아무일도 일어나지 않는다.

func createAddress() -> Address {
    print("Function was called.")

    let someAddress = Address()

    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"
    return someAddress
}

john.residence?.address = createAddress() // residence가 nil이기 때문에 아무 일도 일어나지 않아 함수 호출이 일나지 않는다.

// 옵셔널 체이닝을 통한 메소드 호출

if john.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.")
} // It was not possible to print the number of rooms.

// 옵셔널 체이닝을 통한 서브스크립트 호출

if let firstRoomName = john.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
} // Unable to retrieve the first room name.


john.residence?[0] = Room(name: "Bathroom") // residence가 nil이므로 아무일도 일어나지 않는다.

let johnsHouse = Residence()
johnsHouse.rooms.append(Room(name: "Living Room"))
johnsHouse.rooms.append(Room(name: "Kitchen"))
john.residence = johnsHouse

if let firstRoomName = john.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
} // The first room name is Living Room. 


// 옵셔널 체이닝을 통한 서브스크립트 호출
var testScores: [String: [Int]] = ["Dave": [86,82,84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72 // nil 실패
print("testScores: \(testScores)")

// 여러 수준의 체인 연결

if let johnsStreet = john.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
} // Unable to retrieve the address.


john.residence?.address = createAddress()

if let johnsStreet = john.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
} // John's street name is Acacia Road.

// 옵셔널 체이닝을 통한 메소드 호출

if let buildingIdentifier = john.residence?.address?.buildingIdentifier() {
    print("John's building identifier is \(buildingIdentifier).")
} // John's building identifier is 29 Acacia Road.

if let beginsWithThe =
    john.residence?.address?.buildingIdentifier()?.hasPrefix("The") { //hasPrefix는 문자열이 특정 문자로 시작하는지 확인하는 메소드이다.
        print("\(beginsWithThe)")
        
        if beginsWithThe {
            print("John's building identifier begins with \"The\".")
        } else {
            print("John's building identifier does not begin with \"The\".")
        }
} // John's building identifier does not begin with "The".