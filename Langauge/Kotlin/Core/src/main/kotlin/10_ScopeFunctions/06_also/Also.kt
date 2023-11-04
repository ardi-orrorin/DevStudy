package `10_ScopeFunctions`.`06_also`


// Also
// Context Obejct는 it으로 참조한다.
// 반환값은 객체 자기 자신이다.
// 주로 컨텍스트 인수로 사용하는 액션을 수행할 때 유용하다.
// 객체의 속성 및 함수를 참조가 필요한 작업이나 외부에서 쉐도잉하고 싶이 않은 경우도에도 사용한다.
// 이 객체에 대해서 다음을 수행한다. 라고 읽을 수도 있다.

fun main() {
    val nums = mutableListOf("one", "two", "three")
    nums.also { println("The list elements before adding new one: $it") }
        .add("four")
    println(nums)
}