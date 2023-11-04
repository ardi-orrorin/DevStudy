package `10_ScopeFunctions`.`07_take`


fun main() {
    val str: String = "hello"
    val caps = str.takeIf { it.isNotEmpty() }?.uppercase()
    println(caps)

}