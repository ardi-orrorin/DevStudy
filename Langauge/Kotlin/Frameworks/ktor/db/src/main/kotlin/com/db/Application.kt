package com.db

import com.db.plugins.authenticationConfig
import com.db.plugins.configureDatabases
import com.db.plugins.configureRouting
import com.db.plugins.configureSerialization
import io.ktor.server.application.*

fun main(args: Array<String>) {
    io.ktor.server.netty.EngineMain.main(args)
}

fun Application.module() {
    authenticationConfig()
    configureSerialization()
    configureRouting(configureDatabases())
}
