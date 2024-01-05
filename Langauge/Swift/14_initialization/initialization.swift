
// init() 초기하
struct Fahrenheit {
    var temperature: Double
    init(){
        self.temperature = 32.0
    }
}
var f = Fahrenheit()
print("The default temperature is \(f.temperature)° Fahrenheit")

struct Fahrenheit2 {
    var temperature = 32.0
}


// 초기화 구분 여러개
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double){
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double){
        temperatureInCelsius = kelvin - 273.15
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
print("boilingPointOfWater: \(boilingPointOfWater.temperatureInCelsius)")
print("freezingPointOfWater: \(freezingPointOfWater.temperatureInCelsius)")


struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double){
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white: Double){
        red = white
        green = white
        blue = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
print("magenta: \(magenta.red), \(magenta.green), \(magenta.blue)")

let halfGray = Color(white: 0.5)
print("halfGray: \(halfGray.red), \(halfGray.green), \(halfGray.blue)")

// 인수라벨 생략

struct Celsius2 {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double){
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double){
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double){
        temperatureInCelsius = celsius
    }
}

let bodyTemperature = Celsius2(37.0)
print("bodyTemperature: \(bodyTemperature.temperatureInCelsius)")

// 옵셔널 프로퍼티 타입
class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String){
        self.text = text
    }
    func ask(){
        print(text)
    }
}

let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
cheeseQuestion.response = "Yes, I do like cheese."

// 기본 초기화 구문
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}

var item = ShoppingListItem()
print("item: \(item.name), \(item.quantity), \(item.purchased)") // nil, 1, false

struct Size {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)
print("twoByTwo: \(twoByTwo.width), \(twoByTwo.height)")


// 초기화 구문 위임

struct Size2 {
    var width = 0.0, height = 0.0
}
struct Point2 {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point2()
    var size = Size2()
    init(){}
    init(origin: Point2, size: Size2){
        self.origin = origin
        self.size = size
    }
    init(center: Point2, size: Size2){
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point2(x: originX, y: originY), size: size)
    }
}

let basicRect = Rect()
print("basicRect: \(basicRect.origin.x), \(basicRect.origin.y), \(basicRect.size.width), \(basicRect.size.height)")

let originRect = Rect(origin: Point2(x: 2.0, y: 2.0), 
                            size: Size2(width: 5.0, height: 5.0)
                        )
print("originRect: \(originRect.origin.x), \(originRect.origin.y), \(originRect.size.width), \(originRect.size.height)")


// 2단계 초기화
class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}
let vehicle = Vehicle()
print("vehicle: \(vehicle.description)")

class Bicycle: Vehicle {
    override init(){
        super.init()
        numberOfWheels = 2
    }
}

let bicycle = Bicycle()
print("bicycle: \(bicycle.description)")

class Hoverboard: Vehicle {
    var color: String
    init(color: String){
        self.color = color
        // numberOfWheels = 2
        super.init()
        numberOfWheels = 2
    }
    override var description: String {
        return "\(super.description) in a beautiful \(color)"
    }
}

let hoverboard = Hoverboard(color: "silver")
print("hoverboard: \(hoverboard.description)")

// 지정 초기화 구문과 편의 초기화 구문
class Food {
    var name: String
    init(name: String){
        self.name = name
    }
    convenience init(){
        self.init(name: "[Unnamed]")
    }
}

let namedMeat = Food(name: "Bacon")
print("namedMeat: \(namedMeat.name)")

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int){
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String){
        self.init(name: name, quantity: 1)
    }
}

let oneMysteryItem = RecipeIngredient()
print("oneMysteryItem: \(oneMysteryItem.name), \(oneMysteryItem.quantity)")
