package `09_Classes&Objects`


// Class
// 자바와 다르게 코틀린 class는 객체 템플릿을 가르킨다.
class Car {
    var brand: String = ""
    var model: String = ""
    var year: Int = 0
    override fun toString(): String {
        return "Car(brand='$brand', model='$model', year=$year)"
    }

}

fun main() {
    // Object
    // Object는 자바에서 클래스의 해당
    var c1:Car = Car()
    c1.brand = "Ford"
    c1.model = "Mustang"
    c1.year = 1969

    println(c1.toString())
}


