// basic
let constants = 10; // 상수
var variables = 20; // 변수

// constants = 30; // error: cannot assign to value: 'constants' is a 'let' constant
variables = 40; // 40

variables = if (constants == 10) {
    50
} else {
    60
} // if문을 통해 변수에 값을 할당할 수 있다.

print("variables: \(variables)") // 50

// 선언시 한 줄 선언 가능
var a = 1, b = 2, c = 3
print("a: \(a), b: \(b), c: \(c)") // a: 1, b: 2, c: 3

// 변수의 타입을 지정할 수 있다.
var welcome: String = "Hello"
print("welcome: \(welcome)") // welcome: Hello
// 타입 추론이 가능하면 생략도 가능하다.
var welcome2 = "Hello"
print("welcome2: \(welcome2)") // welcome2: Hello

// 여러개 선언시 한 번에 타입 선언이 가능하다.
var red, green, blue: Double
red = 1.0
green = 2
blue = 30
print("red: \(red), green: \(green), blue: \(blue)") // red: 1.0, green: 2.0, blue: 30.0

// 상수와 변수의 이름은 유니코드 문자를 대부분 포함한다.
let π = 3.141592
let 你好 = "你好世界"
let 한글 = "코리아?"
print("π: \(π), 你好: \(你好), 한글: \(한글)") // π: 3.141592, 你好: 你好世界, 한글: 코리아?


// ;(세미콜론)은 선택사항이다.
// 여러 구문을 한 줄로 작성할 대는 필수로 사용해야 한다.
let cat = "🐱"; print(cat) // 🐱

// 정수의 범위
// Int8, UInt8, Int16, UInt16, Int32, UInt32, Int64, UInt64
// Int는 플랫폼에 따라 32비트 또는 64비트이다. 
// UInt는 플랫폼에 따라 32비트 또는 64비트이다.
// Int는 음수를 포함하고 UInt는 양수만 포함한다. Uint = Unsigned Int
let minUInit8Value = UInt8.min; print("minUInit8Value: \(minUInit8Value)") // minUInit8Value: 0
let maxUInit8Value = UInt8.max; print("maxUInit8Value: \(maxUInit8Value)") // maxUInit8Value: 255
let minIntValue = Int.min; print("minIntValue: \(minIntValue)") // minIntValue: -9223372036854775808
let maxIntValue = Int.max; print("maxIntValue: \(maxIntValue)") // maxIntValue: 9223372036854775807
let minUIntValue = UInt.min; print("minUIntValue: \(minUIntValue)") // minUIntValue: 0
let maxUIntValue = UInt.max; print("maxUIntValue: \(maxUIntValue)") // maxUIntValue: 18446744073709551615

// 수소점이 있는 숫자는 기본적으로 Double 타입이다.
// Float 타입은 6자리까지만 정확하다. 32bit 부동소수점 숫자
// Double 타입은 15자리까지만 정확하다. 64bit 부동소수점 숫자
let floatNumber: Float = 3.14159265358979323846264338327950288419716939937510582097494459230781640628620899
print("floatNumber: \(floatNumber)") // floatNumber: 3.1415927
let doubleNumber: Double = 3.14159265358979323846264338327950288419716939937510582097494459230781640628620899
print("doubleNumber: \(doubleNumber)") // doubleNumber: 3.141592653589793

// 타입 세이프티와 타입 추론
// swift는 type-safe 언어로 타입이 다른 변수끼리는 연산이 불가능하다.
// 타입 추론은 변수를 선언할 때 타입을 명시하지 않아도 컴파일러가 타입을 추론해준다.
let meaningOfLife = 42 // Int 타입으로 추론
let pi = 3.14159 // Double 타입으로 추론
let anotherPi = 3 + 0.14159 // Double 타입으로 추론
print("meaningOfLife: \(meaningOfLife), pi: \(pi), anotherPi: \(anotherPi)") // meaningOfLife: 42, pi: 3.14159, anotherPi: 3.14159

// 숫자 리터럴
// 10진수, 2진수(0b), 8진수(0o), 16진수(0x) 리터럴을 사용할 수 있다.
let decimalInteger = 17 // 10진수
let binaryInteger = 0b10001 // 2진수
let octalInteger = 0o21 // 8진수
let hexadecimalInteger = 0x11 // 16진수
print("decimalInteger: \(decimalInteger), binaryInteger: \(binaryInteger), octalInteger: \(octalInteger), hexadecimalInteger: \(hexadecimalInteger)") // decimalInteger: 17, binaryInteger: 17, octalInteger: 17, hexadecimalInteger: 17

// 1.25e2는 1.25 * 10의 2승을 의미한다.
// 1.25e-2는 1.25 * 10의 -2승을 의미한다.
let decimalDouble = 12.1875 // 10진수
let exponentDouble = 1.21875e3 // 10진수
let hexadecimalDouble = 0xC.3p0 // 16진수
print("decimalDouble: \(decimalDouble), exponentDouble: \(exponentDouble), hexadecimalDouble: \(hexadecimalDouble)") // decimalDouble: 12.1875, exponentDouble: 121.875, hexadecimalDouble: 12.1875

// 정수와 부동소수점 변환
// 정수와 부동 소수점 숫자 타입의 변환은 명시적으로 선언해야 한다.
let three = 3
let pointOneFourOneFiveNine = 0.14159
// let pi = three + pointOneFourOneFiveNine // error: binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
let pi = Double(three) + pointOneFourOneFiveNine // Double 타입으로 변환
print("pi: \(pi)") // pi: 3.14159

// 타입 별칭(Type Aliases)

typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min // UInt16의 최솟값
print("maxAmplitudeFound: \(maxAmplitudeFound)") // maxAmplitudeFound: 0


// 불리언(Boolean)
// true, false
let orangesAreOrange = true
let turnipsAreDelicious = false
if turnipsAreDelicious {
    print("Mmm, tasty turnips!") // 실행되지 않는다.
} else {
    print("Eww, turnips are horrible.") // Eww, turnips are horrible.
}

// 튜플(Tuple)
// 튜플은 여러개의 값을 그룹으로 묶어서 사용할 수 있다.
// 튜플은 다른 타입의 값을 묶어서 사용할 수 있다.

let http404Error = (404, "Not Found")
print("http404Error: \(http404Error)") // http404Error: (404, "Not Found")
print("http404Error.0: \(http404Error.0)") // http404Error.0: 404
print("http404Error.1: \(http404Error.1)") // http404Error.1: Not Found

// 구조 분해 할당이 가능하다.
let (statusCode, statusMessage) = http404Error
print("statusCode: \(statusCode), statusMessage: \(statusMessage)") // statusCode: 404, statusMessage: Not Found

// 튜플의 요소에 이름을 붙일 수 있다. (key: value)
// 이것으로 함수의 리턴값을 여러개로 사용할 수 있다.
let http200Status = (statusCode: 200, description: "OK")
print("http200Status.statusCode: \(http200Status.statusCode), http200Status.description: \(http200Status.description)") // http200Status.statusCode: 200, http200Status.description: OK

// 옵셔널(Optional)
// 지정된 타입의 값이 있고, 옵셔널을 풀어서 값에 접근하거 값이 없을 수도 있다.
// 누락될 수 있는 값의 예제로 문자열 123을 정수로 변환하는 것을 생각해보자.
// 문자열 123은 정수로 변환할 수 있지만, 초기화에 실패할 수 있기 때문에 optional Int 반환한다.


let possibleNumber = "123"
let notPossibleNumber = "abc"
let convertedNumber = Int(possibleNumber) // rovide a default value to avoid this warning
let convertedNumber2 = Int(notPossibleNumber) // nil
print("convertedNumber: \(convertedNumber)") // convertedNumber: Optional(123)
print("convertedNumber: \(convertedNumber!)") // convertedNumber: 123
print("convertedNumber2: \(convertedNumber2)") // convertedNumber2: nil
print("convertedNumber2: \(convertedNumber2!)") // error: Execution was interrupted, reason: EXC_BAD_INSTRUCTION (code=EXC_I386_INVOP, subcode=0x0).

// nil
// nil은 값이 없음을 나타내는 특별한 값이다.
// 타입에 ?을 붙여 nil로 지정할 수 있는 상태를 만들 수 있다.
var serverResponseCode: Int? = 404
serverResponseCode = nil
print("serverResponseCode: \(serverResponseCode)") // serverResponseCode: nil

// if문을 사용해서 nil인지 아닌지 확인할 수 있다.

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!).") // convertedNumber has an integer value of 123.
}

// 옵셔널 바인딩(Optional Binding)
// 옵셔널 값을 포함하고 있는지 확안하고, 값이 있는 경우 해당 값을 임시 상수 또는 변수에 사용할 수 있게 한다.

if let <#constant name#> = <#optional#> {
    <#statements#>
}

// 대체값 제공
let name: String? = nil
let nickName: String = name ?? "test"
print("nickName: \(nickName)") // nickName: test

// 강제 언래핑(Forced Unwrapping)
// !를 사용해서 옵셔널 값을 강제로 추출할 수 있다.

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
let number = convertedNumber!

// error 처리
// throws 키워트를 사용하여 에러가 발생할 수 있음을 나타낸다.
// 에러를 발생할 수 있는 함수를 호출할 때는 try 키워드를 사용한다.
func canThrowAnError() throws {
    // this function may or may not throw an error
}

do {
    try canThrowAnError()
    // no error was thrown
} catch {
    // an error was thrown
}

func makeASandwich() throws {
    // ...
}

do {
    try makeASandwich()
    eatASandwich()
} catch SandwichError.outOfCleanDishes {
    washDishes()
} catch SandwichError.missingIngredients(let ingredients) {
    buyGroceries(ingredients)
}

// assert
// 런타임시 발생하는 조건

let age = -3
// assert(age >= 0, "A person's age cannot be less than zero") // Assertion failed: A person's age cannot be less than zero: file /Users/taehyeon/Documents/Workspace/Study/Swift/Langauge/Swift/02_basic/basic.swift, line 275
assert(age <= 0, "age less zero")