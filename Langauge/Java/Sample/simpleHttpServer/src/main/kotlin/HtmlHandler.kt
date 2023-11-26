import com.sun.net.httpserver.Headers
import com.sun.net.httpserver.HttpExchange
import com.sun.net.httpserver.HttpHandler
import java.io.BufferedReader
import java.io.File
import java.io.OutputStream
import java.net.URI

class HtmlHandler: HttpHandler {
    override fun handle(exchange: HttpExchange) {
        val file: BufferedReader = File("src/main/resources/error.html").bufferedReader()
        val html: String = file.readText()

        val headers: Headers = exchange.responseHeaders
        val uri: URI = exchange.requestURI

        headers.set("Content-Type", "text/html")
        headers.set("Content-Encoding", "UTF-8")
        headers.set("Content-Length", html.length.toString())
        exchange.sendResponseHeaders(200,0)

        val os: OutputStream  = exchange.responseBody

        os.write(html.toByteArray())
        os.close()
    }
}