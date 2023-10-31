package tutorial.Route

import io.ktor.server.application.*
import io.ktor.server.response.*
import io.ktor.server.routing.*

fun Route.customerRouting() {
    route("/test") {
        get("/1") {
            var test: MutableMap<String, String> = mutableMapOf();
            test.put("test", "test123")

            call.respond(test)
        }

        get("/path/{id}") {
            // pathParams
            val path: String = call.parameters["id"]!!
            call.respond(path)
        }
        get("/query") {

            // queryParams
            val params: String = call.request.queryParameters["test"]!!

            call.respond(params)
        }
    }
}