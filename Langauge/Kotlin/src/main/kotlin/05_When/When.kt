package `05_When`

fun main() {
    // switch case 문으로 코틀린에서는 when 문법으로 대체되었다.
    val day: Int = 2
    val result = when (day) {
        1 -> "Mon"
        2 -> "Tue"
        3 -> "Wed"
        else -> "Other"
    }

    println(result)
}