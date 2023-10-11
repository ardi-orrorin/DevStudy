package `10_ScopeFunctions`.`03_with`

// With
// Context Object는 this로 참조 한다.
// 리턴값은 람다의 결과값으로 한다.
// 주로 반환된 결과값이 필요가 없을 경우에 사용한다.
// return Type Boolean이다.
fun main() {
    val nums = mutableListOf("one", "two", "three")

    with(nums) {
        println("'with' is called with argument $this")
        println("It contains $size elements")
    }

}