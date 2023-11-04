package `04_Conditions`

fun main() {
    val x: Int = 20
    val y: Int = 18

    if (x > y) {
        println("x")
    } else if (x < y) {
        println("y")
    } else {
        println("==")
    }

    val z: Int = if(x > y) 1 else 0
    println(z)

//    val a: Int = x > y ? 1 : 0 // error


}