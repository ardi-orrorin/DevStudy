fun main() {
    fun O1(array: IntArray, index: Int): Int {
        return array[index]
    }
    val arr: IntArray = intArrayOf(1,2,3,4,5)
    val index = 3
    println(O1(arr, index)) // 4
}

fun On(n: Int) {
    for (i in 0..n) {
        // 실행문
    }
}
