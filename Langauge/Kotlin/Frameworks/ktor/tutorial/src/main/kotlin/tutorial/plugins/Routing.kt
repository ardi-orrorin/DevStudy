package tutorial.plugins

import io.ktor.server.application.*
import io.ktor.server.response.*
import io.ktor.server.routing.*
import tutorial.Route.customerRouting

fun Application.configureRouting() {
    routing {
        get("/") {
            call.respondText("Hello World!")
        }

        customerRouting()
    }
}
