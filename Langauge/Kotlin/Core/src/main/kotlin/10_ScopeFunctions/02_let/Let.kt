package `10_ScopeFunctions`.`02_let`


// let
// Context Obejct는 it으로 사용할 수 있다.
// return 값은 람다의 결과
// let 하나 이상의 함수를 호출하는데 사용할 수 있다.

fun main() {
    val nums = mutableListOf("one", "two", "three", "four");

    // 기존의 방법
    val resultList = nums.map { it.length }.filter { it > 3 }
    println(resultList)

    // let 이용
    nums.map { it.length }.filter { it > 3 }.let { println(it) }
    nums.map { it.length }.filter { it > 3 }.let ( ::println ) // ::람다식 지원

    nums.first().let {
        println("The first item fo the list is '$it'")
        if (it.length >= 5) it else "!" + it + "!"
    }.uppercase()
    .also {
        println("Fist item after modifications : '$it'")
    }

}