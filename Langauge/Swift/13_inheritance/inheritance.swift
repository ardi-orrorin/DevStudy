// 상속

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise(){
        // do nothing
    }
}

let someVehicle = Vehicle()
print("Vehicle: \(someVehicle.description)")

class Bicycle: Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")

class Tandom: Bicycle {
    var currentNumberOfPassengers = 0
}

let tandom = Tandom()
tandom.hasBasket = true
tandom.currentNumberOfPassengers = 2
tandom.currentSpeed = 22.0
print("Tandom: \(tandom.description)")

// 오버라이딩

class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}
let train = Train()
train.makeNoise()


class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")

class AutomaticCar: Car {
    override var currentSpeed: Double{
        // willSet, didSet : 프로퍼티의 값이 바뀌기 직전과 직후에 호출된다
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}


let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")

// 재정의 방지
// final 키워드를 사용한다.
// final var, final func, final class func, final subscript, final class