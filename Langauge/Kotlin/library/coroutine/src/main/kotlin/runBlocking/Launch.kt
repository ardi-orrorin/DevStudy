package runBlocking

import kotlinx.coroutines.*

// runBlocking
// 블록킹 코드와 비 블록킹 코드를 함께 사용할 수 있게 해준다.

// launch 코루틴 빌더 역할
// launch 안에 코드는 독립적으로 계속 실행된다.

fun main() = runBlocking {
    launch {
        doWorld()
//        doWorldBlocking()
        doWorld3()
    }
    launch {
        doWorld2()
    }
    println("hello")
}


// suspend 키워드
// suspend 키워드가 붙은 함수는 비 블록킹 코드로 사용할 수 있다.
suspend fun doWorld() {
    delay(1000L)
    println("World!")
}

suspend fun doWorld2() {
    delay(1000L)
    println("World2!")
}
suspend fun doWorld3() {
    delay(1000L)
    println("World3!")
}


fun doWorldBlocking() {
    Thread.sleep(1000L)
    println("World!!!!")
}