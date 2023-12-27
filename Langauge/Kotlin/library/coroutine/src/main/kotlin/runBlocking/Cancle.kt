package runBlocking

import kotlinx.coroutines.*


fun main() = runBlocking {
//    cancelBlock()
//    cancellation()
//    finallyBlock()
//    nonCancel()
//    timeoutBlock()
//    timeoutOrNull()
//    asyncClose()
    asyncClose2()
}




fun cancelBlock() = runBlocking {
    val job = launch {
        repeat(3000) { i ->
            println("I'm sleeping $i ...")
            delay(500L)
        }
    }
    delay(1300L)
    println("main: I'm tired of waiting!")
    job.cancel() // 취소
    job.join() // 기다린다.
    delay(2300L)
    println("main: Now I can quit.")
    // I'm sleeping 0 ...
    // I'm sleeping 1 ...
    // I'm sleeping 2 ...
    // main: I'm tired of waiting!
    // main: Now I can quit.
}

fun cancellation() = runBlocking {
    val startTime = System.currentTimeMillis()
    val job = launch(Dispatchers.Default) {
        var nextPrintTime = startTime
        var i = 0
        while (i < 5) { // 5초 동안 반복
            if (System.currentTimeMillis() >= nextPrintTime) {
                println("job: I'm sleeping ${i++} ...")
                nextPrintTime += 500L
            }
        }
    }
    delay(1300L)
    println("job: I'm running finally")
    job.cancelAndJoin() // 취소하고 기다린다.
    println("main: runBlocking")
    // job: I'm sleeping 0 ...
    // job: I'm sleeping 1 ...
    // job: I'm sleeping 2 ...
    // job: I'm running finally
    // job: I'm sleeping 3 ...
    // job: I'm sleeping 4 ...
    // main: runBlocking
}


fun finallyBlock() = runBlocking {
    val job = launch(Dispatchers.Default) {
        try {
            repeat(1000) { i ->
                println("job: I'm sleeping $i ...")
                delay(500L)
            }
        } finally {
            println("job: I'm running finally")
        }
    }
    delay(1300L)
    println("main: I'm tired of waiting!")
    job.cancelAndJoin() // 취소하고 기다린다.
    println("main: Now I can quit.")
    // job: I'm sleeping 0 ...
    // job: I'm sleeping 1 ...
    // job: I'm sleeping 2 ...
    // main: I'm tired of waiting!
    // job: I'm running finally
    // main: Now I can quit.
}

fun nonCancel() = runBlocking {
    val job = launch {
        try {
            repeat(1000) { i ->
                println("job: I'm sleeping $i ...")
                delay(500L)
            }
        } finally {
            withContext(NonCancellable) {// 취소되지 않는다.
                println("job: I'm running finally")
                delay(1500L)
                println("job: And I've just delayed for 1.5 sec because I'm non-cancellable")
            }
//            println("job: I'm running finally")
//            delay(1500L) // 취소된다
//            println("job: And I've just delayed for 1.5 sec because I'm non-cancellable") // 취소된다
        }
    }
    delay(1300L)
    println("main: I'm tired of waiting!")
    job.cancelAndJoin() // 취소하고 기다린다.
    println("main: Now I can quit.")
}

fun timeoutBlock() = runBlocking {
    withTimeout(1000L) {
        repeat(1000) { i ->
            println("I'm sleeping $i ...")
            delay(500L)
        }
    }
}
// I'm sleeping 0 ...
// I'm sleeping 1 ...
// Exception in thread "main" kotlinx.coroutines.TimeoutCancellationException: Timed out waiting for 1000 ms

fun timeoutOrNull() = runBlocking {
    val result = withTimeoutOrNull(1000L) {
        repeat(1000) { i ->
            println("I'm sleeping $i ...")
            delay(500L)
        }
        "Done" // 결과가 생성되지 전에 취소된다.
    }
    println("Result is $result")
    // I'm sleeping 0 ...
    // I'm sleeping 1 ...
    // Result is null
}

var acquired = 0
class Resource {
    init { acquired++  }
    fun close() { acquired-- }
}

fun asyncClose() = runBlocking {
    repeat(10_000){
        launch {
            val resource = withTimeout(60) {
                delay(50)
                Resource()
            }
            resource.close()
            println("acquired: $acquired")
        }
    }
    println(acquired)
}

fun asyncClose2() = runBlocking {
    repeat(10_000){
        launch {
            var resource: Resource? = null
            try {
                withTimeout(60) {
                    delay(50)
                    resource = Resource()
                }
            } finally {
                resource?.close()

            }
        }
    }
    println(acquired)
}
