// 에러 처리

// 에러 표현 던지기

enum VendingMachneError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

// 에러 던지기
throw VendingMachneError.insufficientFunds(coinsNeeded: 5)

// 함수를 이용한 에러 전파
// func canThrowErrors() throws -> String
// func cannotThrowErrors() -> String

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar" : Item(price: 12, count: 7),
        "Chips" : Item(price: 10, count: 4),
        "Pretzels" : Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0

    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachneError.invalidSelection
        }

        guard item.count > 0 else {
            throw VendingMachneError.outOfStock
        }

        guard item.price <= coinsDeposited else {
            throw VendingMachneError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price

        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem

        print("Dispensing \(name)")
    }
}

let favoriteSnacks = [
    "Alice" : "Chips",
    "Bob" : "Licorice",
    "Eve" : "Pretzels"
]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"

    try vendingMachine.vend(itemNamed: snackName)
}

var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
    print("Success! Yum.")
} catch VendingMachneError.invalidSelection {
    print("Invalid Selection.")
} catch VendingMachneError.outOfStock {
    print("Out of Stock.")
} catch VendingMachneError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
} catch {
    print("Unexpected error: \(error).")
}

// 정리 작접 지정
// defer는 현재 블럭에서 종료되기 직전에 실행되는 코드를 작성할 수 있습니다.
func processFile(filename: Sgtirng) throws {
    if exists(filename) {
        let file = open(filename)
        defer {
            close(file)
        }
        while let line = try file.readline() {
            // 파일을 처리합니다.
        }
        // close(file)가 호출됩니다.
    }
}
