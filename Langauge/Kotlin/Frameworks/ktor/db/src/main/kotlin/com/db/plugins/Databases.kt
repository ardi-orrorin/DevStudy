package com.db.plugins

import com.db.service.MemberService
import io.ktor.server.application.*
import org.jetbrains.exposed.sql.Database

fun Application.configureDatabases() =
    Database.connect(
                    url = environment.config.property("db.url").getString(),
                    user = environment.config.property("db.user").getString(),
                    driver = environment.config.property("db.driver").getString(),
                    password = environment.config.property("db.password").getString()
    )