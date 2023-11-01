package com.db.dao

import org.jetbrains.exposed.dao.id.IntIdTable
import org.jetbrains.exposed.sql.Table
import org.jetbrains.exposed.sql.javatime.timestamp

object Member: IntIdTable("TBL_MEMBER") {
    val userId = varchar("USER_ID", 255)
    val userPwd = varchar("USER_PWD", 255)
    val email = varchar("EMAIL", 255)
    val creteAt = timestamp("CREATEAT")
    val deleteAt = timestamp("DELETEAT")

}