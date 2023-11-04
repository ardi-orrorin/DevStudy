package `10_ScopeFunctions`.`04_run`

import javax.management.Query

// run
// Context object를 this로 참조한다.
// 리턴값은 람다의 결과값으로 한다.
// let가 비슷하지만 run은 객체를 초기화하여 반환할 경우 유용하다.

class MultiportService(var url:String, var port: Int){
    override fun toString(): String {
        return "MultiportService(url='$url', port=$port)"
    }
}

fun main() {
    val service = MultiportService("http://example.kotlinlang.org", 80)

    println("service : " + service.toString())

    val letResult = service.let {
        println("let : " + it)
        it.port = 8080
        it.url = "http://test.com"
        it.toString()
    }

    println("service : " + service.toString())

    val result = service.run {
        println("run : " + this)
        port = 8080
        url = "http://test.com"
        toString()
    }

    println("result : " + result)
    println("letResult : " + letResult)
}