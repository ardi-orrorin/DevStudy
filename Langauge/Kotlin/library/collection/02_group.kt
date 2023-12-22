// grouping
/*
    컬렉션의 요소를 그룹화 하기 위한 확장 함수로
    groupBy()는 람다 함수를 받아 map으로 반환하여. key는 람다 함수의 결과 값이고
    value는 람다 함수의 결과 값이 같은 요소들의 리스트로 반환한다.
*/

fun main() {

    val numbers = listOf("one", "two", "three", "four", "five")
    println(numbers.groupBy { it.first().uppercase() }) // {O=[one], T=[two, three], F=[four, five]}

    val numbers2 = listOf(1, 2, 4, 5, 6)
    println(numbers2.groupBy { if (it % 2 == 0) "even" else "odd" }) // {odd=[1, 5], even=[2, 4, 6]}

    val numbers3 = listOf("one", "two", "three", "four", "five", "six")
    println(
            numbers3.groupBy(keySelector = { it.get(1) }, valueTransform = { it.toUpperCase() })
    ) // {o=[ONE, TWO, FOUR], h=[THREE, SIX], i=[FIVE]}

    // groupingBy()
    // 그룹화 한 다면 모든 그룹에 한 번에 작업을 적용하려 할 때 사용한다.

    val numbers4 = listOf("one", "two", "three", "four", "five", "six")
    println(numbers4.groupingBy { it.first() }.eachCount()) // {o=2, t=2, f=2}
}
