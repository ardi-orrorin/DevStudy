package com.db.router

import com.db.schema.DiarySchema
import com.db.schema.MemberSchema
import com.db.service.DiaryService
import com.db.service.MemberService
import io.ktor.http.*
import io.ktor.server.application.*
import io.ktor.server.request.*
import io.ktor.server.response.*
import io.ktor.server.routing.*
import org.jetbrains.exposed.sql.Database
import org.slf4j.Logger
import org.slf4j.LoggerFactory


fun Route.diaryRouting(
    database: Database
){
    val diaryService: DiaryService = DiaryService(database)

    val log = LoggerFactory.getLogger(this.javaClass)

    route("/diary") {
        get("/{id}") {
            val id = call.parameters.get("id")!!.toInt()

            call.respond(HttpStatusCode.OK, diaryService.loadByDiaryId(id))
        }

        get("all") {
            call.respond(HttpStatusCode.OK, diaryService.loadByDiary())
        }

        get("test"){
            call.respond(HttpStatusCode.OK,"dfdfd")
        }
        post("create") {
            val diary:DiarySchema = call.receive<DiarySchema>()

            log.info("[{}]({}) : {}: {}",
                object{}.javaClass.enclosingClass.name,
                object{}.javaClass.enclosingMethod.name,
                "diary", diary
            )


            call.respond(HttpStatusCode.Created, diaryService.insertByDiary(diary, "test123").isIgnore)
        }
    }
}