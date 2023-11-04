package `01_Time`

import kotlin.time.Duration
import kotlin.time.Duration.Companion.milliseconds
import kotlin.time.Duration.Companion.minutes
import kotlin.time.Duration.Companion.seconds
import kotlin.time.DurationUnit

fun main() {

    // 확장 함수 이용한 시간 표시
    val milliseconds: Duration = 500.milliseconds
    println(milliseconds) // 5ms

    println("=====================================")

    val seconds: Duration = 5.seconds
    val fiveThousandMilliseconds: Duration = 5000.milliseconds

    println(seconds) // 5s
    println(fiveThousandMilliseconds) // 5s

    println("=====================================")

    val minutes: Duration = 5.minutes
    val threeHundredThousandMilliseconds: Duration = 300000.milliseconds
    val threeHundredThousandSeconds: Duration = 300.seconds

    println(minutes) // 5m
    println(threeHundredThousandMilliseconds) // 5m
    println(threeHundredThousandSeconds) // 5m

    println("=====================================")

    // DurationUnit 이용한 시간 표시
    // decimals 표시할 자리수 반올림 된다.
    println(5678.milliseconds.toString(DurationUnit.SECONDS, 2)) // 5.68s

    println("=====================================")

    println(5678.seconds.toIsoString()) // PT1H34M38S








}