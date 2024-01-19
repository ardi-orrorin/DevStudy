// 메모리 안정성(Memory Safety)

var one = 1
print("We're number \(one)!")

// 메모리 접근의 특징
/*
    아래의 2가지 특징중 2개의 접근이 있다면 충돌이 발생한다.
    1. 적어도 하나의 쓰기 접근 또는 nonatomic 접근
    2. 메모리의 같은 위치에 접근
    3. 접근하는 시간이 겹친다.
*/

// 장기접근 : 시작에서 종료되기 전에 다른 코드가 실행 될 수 있는 접근
// 단기접근 : 시작과 종료가 빠르게 이루어져서 다른 코드가 실핼 될 수 없는 접근


// int-out 파라피미터에 충돌 접근
var stepSize = 1
func increment(_ number: inout Int) {
    number += stepSize
}
// increment(&stepSize)
//error : 읽기 접근과 쓰기 접근이 오버랩된다

// 해결 방법
// 복사본 만들어서 전달
var copyOfStepSize = stepSize
increment(&copyOfStepSize)
print("stepSize is now \(copyOfStepSize)")
print("stepSize is still \(stepSize)")

func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum / 2
    y = sum - x
}

var playerOneScore = 42
var playerTwoScore = 30
balance(&playerOneScore, &playerTwoScore)
print("playerOneScore is now \(playerOneScore)")
print("playerTwoScore is now \(playerTwoScore)")
// balance(&playerOneScore, &playerOneScore) : 동시에 같은 변수에 쓰기 접근이 일어나서 충돌이 발생한다.

// 메서드에서 self 충돌 접근
struct Player {
    var name: String
    var health: Int
    var energy: Int

    static let maxHealth = 10
    mutating func restoreHealth() {
        health = Player.maxHealth
    }
}

extension Player {
    mutating func shareHealth(with teammate: inout Player) {
        balance(&teammate.health, &health)
    }
}

var oscar = Player(name: "Oscar", health: 10, energy: 10)
var maria = Player(name: "Maria", health: 5, energy: 10)
oscar.shareHealth(with: &maria)
// oscar.shareHealth(with: &oscar) : 동시에 같은 변수에 쓰기 접근이 일어나서 충돌이 발생한다.

// 프로퍼티에서 충돌 접근
var playerInformation = (health: 10, energy: 20)
// balance(&playerInformation.health, &playerInformation.energy) : 동시에 같은 변수에 쓰기 접근이 일어나서 충돌이 발생한다.
