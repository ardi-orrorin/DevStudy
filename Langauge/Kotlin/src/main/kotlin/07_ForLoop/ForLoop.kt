package `07_ForLoop`

fun main() {

    // 코틀린에서는 전통적인 for문이 존재 하지 않는다
    // for(i=0; i< x; i++){} 문법 사용 불가

    val nums:Array<Int> = arrayOf(1, 5, 6, 7, 8, 10)

    for(x:Int in nums){
        println(x)
    }

    // Ranges

    // 문자
    for(char:Char in 'a'..'z'){
        print(char + " ")
    }
    println()

    // 숫자
    for(num:Int in 1..10){
        print(num.toString() + " ")
    }
    println()



}