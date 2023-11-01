package com.db.plugins

import com.db.router.diaryRouting
import com.db.router.memberRouting
import io.ktor.server.application.*
import io.ktor.server.routing.*
import org.jetbrains.exposed.sql.Database

fun Application.configureRouting(
    database: Database
) {
    routing {
        get("/"){}

        memberRouting(database)

        diaryRouting(database)
    }
}
