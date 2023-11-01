package com.db.dao

import org.jetbrains.exposed.dao.id.IntIdTable
import org.jetbrains.exposed.sql.ReferenceOption
import org.jetbrains.exposed.sql.Table
import org.jetbrains.exposed.sql.javatime.timestamp

object Diary: IntIdTable("TBL_DIARY") {
    val subject = varchar("SUBJECT",255)
    val content = text("CONTENT")
    val createAt = timestamp("CREATEAT")
    val updateAt = timestamp("UPDATEAT")
    val deleteAt = timestamp("DELETEAT")

    val member = reference("REF_MEMBER_ID", Member, ReferenceOption.CASCADE)

}