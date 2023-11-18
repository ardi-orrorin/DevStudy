import kotlinx.coroutines.*

fun main() = runBlocking {
    doWorldscope()
    println("done")
}

suspend fun doWorldscope() = coroutineScope {
    launch {
        delay(2000L)
        println("World 2")
    }
    launch {
        delay(1000L)
        println("World 1")
    }
}