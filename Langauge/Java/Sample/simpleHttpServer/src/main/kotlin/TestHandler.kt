import com.sun.net.httpserver.HttpContext
import com.sun.net.httpserver.HttpExchange
import com.sun.net.httpserver.HttpHandler
import javax.naming.Context

class TestHandler: HttpHandler {
    override fun handle(exchange: HttpExchange?) {
        val response = "Hello World"
        exchange?.sendResponseHeaders(200, response.length.toLong())
        exchange?.responseHeaders?.add("Content-Type", "text/html")
        println("Hello World")
        val os = exchange?.responseBody

        os?.write(response.toByteArray())
        os?.close()
    }
}