package `09_Classes&Objects`


// Class Constructor
class Cars(var brand: String, var model: String,var year: Int) {
    override fun toString(): String {
        return "Cars(brand='$brand', model='$model', year=$year)"
    }
}

fun main() {
    var c1 = Cars("Ford", "Mustang", 1969)
    var c2 = Cars("BMW", "X5", 1999)

    println(c1)
    println(c2)
}