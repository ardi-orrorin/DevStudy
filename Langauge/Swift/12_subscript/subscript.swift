// 서브스크립트
// ㄴ 서브스크립트는 클래스, 구조체, 열거형에 속한 멤버이며, 컬렉션, 리스트, 시퀀스 등의 요소에 접근할 수 있는 단축 문법이다.

// 서브스크립트 문법
subscript(index: Int) -> Int {
    get {
        // 적절한 서브스크립트 결과값 반환
    }
    set(newValue) {
        // 적절한 설정자 역할 수행
    }
}

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")


struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }

    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)
print(matrix.grid)
matrix[0, 1] = 1.5
matrix[1, 0] = 3.2
print(matrix.grid)
print(matrix[2 , 2]) // Index out of range

// 타입 서브 스크립트
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}

print("Earth is \(Planet[3])")
print("Venus is \(Planet[2])")
