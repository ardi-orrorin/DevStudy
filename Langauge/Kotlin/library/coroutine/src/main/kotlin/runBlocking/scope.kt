import kotlinx.coroutines.*

fun main() = runBlocking {
    doWorldscope()
    println("done")
    subMain()
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


fun subMain() = runBlocking {
    val job = launch {
        delay(2000L)
        println("World!")
    }

    println("Hello,")
    job.join()
    println("done")
}
// explicit job
