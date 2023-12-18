package `08_Funtions`

fun main() {
    // baisc()
    // functionType()
    // anonymousFunction()
    closure()
}

fun baisc() {
    val items = listOf(1, 2, 3, 4, 5)
    items.fold(
            0,
            { acc: Int, i: Int -> // acc current value, i next value
                println("acc = $acc, i = $i, acc + i = ${acc + i}")
                val result = acc + i
                result
            }
    )
    val joinedToString = items.fold("Elements:", { acc, i -> acc + " " + i })
    println(joinedToString) // Elements: 1 2 3 4 5

    val product = items.fold(1, Int::times)
    println(product) // 120
}

fun functionType() {
    val stringPlus: (String, String) -> String = String::plus
    println(stringPlus("Hello, ", "world!")) // Hello, world!
    val intPlus: Int.(Int) -> Int = Int::plus
    println(20.intPlus(31)) // 51yhnj
    println(intPlus.invoke(1, 12)) // 13
    println(intPlus(1, 32)) // 13
}

fun anonymousFunction() {
    fun compare(a: String, b: String): Boolean = a.length < b.length
    val sum: (Int, Int) -> Int = { x: Int, y: Int -> x + y }
    println(sum(1, 2)) // 3
    val items = listOf(1, 2, 3, 4, 5)
    val product = items.fold(1) { acc, e -> acc * e }
    println(product) // 120

    fun(x: Int, y: Int): Int = x + y
    items.filter(fun(item) = item > 3).forEach { println(it) } // 4 5
}

fun closure() {
    var sum = 0
    val ints = listOf(1, 2, 3, 4, 5)
    ints.filter { it > 0 }.forEach { sum += it }
    println(sum) // 15
}
