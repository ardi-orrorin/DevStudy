// 구조체와 클래스 비교
/*
    공통점
    - 갑승ㄹ 저장하는 프로퍼티를 정의할 수 있다.
    - 기능 제공을 위한 메서드 정의
    - 서브 스크립트 구문을 사용하여 값에 접근을 제공하는 서브 스크립트 정의
    - 초기화 상태를 설정하기 위한 초기화 정의
    - 기본 구현을 넘어 기능적 확장을 위한 확장
    - 특정 종류의 표준 기능을 제공하는 프로토콜 준수

    클래스만 할 수 있는 것
    - 상속
    - 타입 캐스팅을 사용하면 런타임에 클래스 인스턴스의 타입을 확인하고 해석할 수 있다.
    - 초기화 해제 구문(Deinitializers)을 사용하면 클래스의 인스턴스가 할당된 리소스를 해제할 수 있다.
    - 참조 카운팅은 하나 이상의 클래스 인스턴스 참조를 허락한다.  
*/

// 정의 구문
struct SomeStructure {
    // 구조체 정의
}
class SomeClass {
    // 클래스 정의
}

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution() // 구조체 인스턴스를 프로퍼티로 사용
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let someResolution = Resolution()
let someVideoMode = VideoMode()

// 프로퍼티 접근
print("The width of someResolution is \(someResolution.width)")
print("The width of someVideoMode is \(someVideoMode.resolution.width)")

someVideoMode.resolution.width = 1280
print("The width of someVideoMode is \(someVideoMode.resolution.width)")
print("The width of someVideoMode is \(someResolution.width)")

// 구조체 타입에 초기화 구문
// 구조체는 값 타입으로 변수 또는 상수 도는 함수에 전달될 때 값이 복사가 된다.
let vga = Resolution(width: 640, height: 480)
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd // cinema는 hd의 깊은 복사 값이다.
cinema.width = 2048
print("cinema is now \(cinema.width) pixels wide") 
print("hd is still \(hd.width) pixels wide")

// 클래스 참조타입
// 값 타입과 반대로 참조 타입은 변수 또는 상수에 할당될 때나 함수로 전달되 때는 복사되지 않는다.
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEigthy = tenEighty
alsoTenEigthy.frameRate = 30.0

// 하나의 인스턴스를 참조하는 두 상수
print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
print("The frameRate property of alsoTenEigthy is now \(alsoTenEigthy.frameRate)")


// 식별 연산자
// === : 동일 인스턴스
// !== : 다른 인스턴스
if tenEighty === alsoTenEigthy {
    print("tenEighty and alsoTenEigthy refer to the same Resolution instance.")
}
