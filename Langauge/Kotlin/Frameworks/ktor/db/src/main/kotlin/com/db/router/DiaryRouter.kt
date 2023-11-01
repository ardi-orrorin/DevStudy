package com.db.router

import com.db.service.DiaryService
import com.db.service.MemberService
import io.ktor.http.*
import io.ktor.server.application.*
import io.ktor.server.response.*
import io.ktor.server.routing.*
import org.jetbrains.exposed.sql.Database


fun Route.diaryRouting(
    database: Database
){
    val diaryService: DiaryService = DiaryService(database)

    route("/diary") {
        get("/{id}") {
            val id = call.parameters.get("id")!!.toInt()

            println(id)
            call.respond(HttpStatusCode.OK, diaryService.loadByDiaryId(id))

        }
    }
}