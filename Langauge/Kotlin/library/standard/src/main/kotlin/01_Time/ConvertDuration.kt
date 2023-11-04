package `01_Time`

import java.util.*
import kotlin.time.*
import kotlin.time.Duration.Companion.hours
import kotlin.time.Duration.Companion.milliseconds
import kotlin.time.Duration.Companion.minutes
import kotlin.time.Duration.Companion.seconds

fun main() {

    val milliseconds: Duration = 5000.milliseconds
    println(milliseconds.inWholeSeconds) // 5

    println("=====================================")

    val hour: Duration = (1000 * 60 * 60 * 1).milliseconds
    println(hour.inWholeSeconds) // 3600
    println(hour.inWholeMinutes) // 60
    println(hour.inWholeHours) // 1


    println("=====================================")


    println(300.seconds.toDouble(DurationUnit.MINUTES)) // 5.0

    println("=====================================")

    // 시간 비교
    val thiryMinutes : Duration = 30.minutes
    val halfHour : Duration = 0.5.hours

    println(thiryMinutes == halfHour) // true

    val fiveMinutes: Duration = 5.minutes
    println(halfHour - fiveMinutes) // 30m
    println((halfHour - fiveMinutes).toDouble(DurationUnit.HOURS)) // 0.4166666666666667

    println("=====================================")

    // 시간 컴포넌트
    // 원하는 시간 단위로 시간을 표시할 수 있다.
    println(thiryMinutes.toComponents { hours, minutes, _, _ ->
        println("${hours}h:${minutes}m") // 0h:30m
    })

    println("=====================================")

    // 시작 측정
    val timeTaken = measureTime {
        Thread.sleep(1000)
    }

    println(timeTaken) // 1.005s

    println("=====================================")

    val (value, time) = measureTimedValue {
        Thread.sleep(1000)
        100
    }

    println(value)
    println(time) // 1.007s

    println("=====================================")
    

}