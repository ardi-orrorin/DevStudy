package `08_Funtions`

// 클래스 확장
// 수신타입.함수명(매개변수): 반홭타임 { 구현부 }

fun String.hello() = println("Hello $this")

fun MutableList<Int>.swap(index1: Int, index2: Int): MutableList<Int> {
    val temp = this[index1]
    this[index1] = this[index2]
    this[index2] = temp
    return this
}

fun main() {
    "확장 클래스".hello()

    println(mutableListOf(1,2,3).swap(0,1))
}

