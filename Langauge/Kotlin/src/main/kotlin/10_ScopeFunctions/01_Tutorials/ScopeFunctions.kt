package `10_ScopeFunctions`

// Scope funcitons
// 객체를 사용할 때, Scope를 일시적으로 만들어서 속성, 함수를 처리하는 용도로 사용된다.
class Car(var brand: String, var model: String, var year: Int)
fun main() {
    val c1 = Car("Ford", "Mustang", 1936)

    c1.run {
        // run, with, apply는 Context Object를 this로 참조한다.
        // this는 생략이 가능하다.

        println(this.brand)
        println(brand)

        brand = "Parale" // 속성 변경 가능

        println(this.brand)
        println(brand)
    }

    val c2 = Car("BMW", "X5", 1999)
    c2.let {
        println(it.brand)
//        println(brand) // error
        it.brand = "BBB" // 속성 변경
        println(it.brand)
    }

}
