package com.db.router

import com.db.service.MemberService
import io.ktor.http.*
import io.ktor.server.application.*
import io.ktor.server.response.*
import io.ktor.server.routing.*
import org.jetbrains.exposed.sql.Database


fun Route.memberRouting(
    database: Database
){
    val memberService: MemberService = MemberService(database)

    route("/member") {
        get("{userId}") {
            val userId = call.parameters.get("userId").toString()
            println(userId)

            call.respond(HttpStatusCode.OK, memberService.loadMemberId(userId))

        }
    }
}