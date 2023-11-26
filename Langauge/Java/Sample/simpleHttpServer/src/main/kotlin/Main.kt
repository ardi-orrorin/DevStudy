import com.sun.net.httpserver.HttpServer
import java.net.InetSocketAddress


fun main(args: Array<String>) {
    val server : HttpServer = HttpServer.create()
    server.bind(InetSocketAddress(8080), 0)
    server.createContext("/test", TestHandler())
    server.createContext("/html", HtmlHandler())

    server.executor = null
    server.start()
}







