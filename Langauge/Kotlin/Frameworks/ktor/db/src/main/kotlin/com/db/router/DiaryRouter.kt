package com.db.router

import com.db.schema.DiarySchema
import com.db.schema.MemberSchema
import com.db.service.DiaryService
import com.db.service.MemberService
import io.ktor.http.*
import io.ktor.http.content.*
import io.ktor.server.application.*
import io.ktor.server.auth.*
import io.ktor.server.request.*
import io.ktor.server.response.*
import io.ktor.server.routing.*
import kotlinx.serialization.Serializable
import org.jetbrains.exposed.sql.Database
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import java.io.File


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
            val name = call.principal<UserIdPrincipal>()!!.name

            log.info("[{}]({}) : {}: {}",
                object{}.javaClass.enclosingClass.name,
                object{}.javaClass.enclosingMethod.name,
                "name", name
            )
            call.respond(HttpStatusCode.OK,call.principal<UserIdPrincipal>()!!.name)
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

        post("multi") {
            val file = call.receiveMultipart()
            var filename = ""
            var files: ByteArray
            val filePath = "resource/static/img"
            file.forEachPart { pt ->
                when (pt) {
                    is PartData.FormItem -> {
                        log.info(
                            "[{}]({}) : {}: {}",
                            object {}.javaClass.enclosingClass.name,
                            object {}.javaClass.enclosingMethod.name,
                            "file formItem", pt
                        )
                    }

                    is PartData.FileItem -> {
                        log.info(
                            "[{}]({}) : {}: {}",
                            object {}.javaClass.enclosingClass.name,
                            object {}.javaClass.enclosingMethod.name,
                            "file fileItem", pt
                        )

                        filename = pt.originalFileName!!
                        log.info(
                            "[{}]({}) : {}: {}",
                            object {}.javaClass.enclosingClass.name,
                            object {}.javaClass.enclosingMethod.name,
                            "filename : ", filename
                        )

                        if (!File(filePath).isDirectory)
                            File(filePath).mkdirs()

                        files = pt.streamProvider().readBytes()
                        File(filePath, filename).writeBytes(files)

                    }

                    else -> {
                        log.info(
                            "[{}]({}) : {}: {}",
                            object {}.javaClass.enclosingClass.name,
                            object {}.javaClass.enclosingMethod.name,
                            "else it", pt
                        )
                    }
                }
                pt.dispose()

                call.respond(HttpStatusCode.OK, File(filePath,filename).readBytes())
            }

        }
    }
}