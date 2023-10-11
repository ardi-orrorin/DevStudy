package `09_Classes&Objects`

class CarF(var brand: String, var model: String, var year: Int) {
    fun drive(): Unit {
        println("Move!!!")
    }

    fun speed(speed: Int): Unit {
        println(speed)
    }
}

fun main() {
    val c1: CarF = CarF("Ford", "Mustang", 1969)
    c1.drive();
    c1.speed(100)
}