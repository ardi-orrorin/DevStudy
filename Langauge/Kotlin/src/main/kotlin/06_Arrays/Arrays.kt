package `06_Arrays`

fun main() {
    // 배열 담기
    val cars:Array<String> = arrayOf("volvo", "BMW", "Ford")

    val isCars: Boolean = if ("volvo" in cars) true else false

    println("exists Volvo ? " + isCars)

    for (x:String in cars){
        println(x)
    }

}