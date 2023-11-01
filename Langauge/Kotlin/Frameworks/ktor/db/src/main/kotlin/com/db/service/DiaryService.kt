package com.db.service

import com.db.dao.Diary
import com.db.dao.Member
import com.db.schema.DiarySchema
import com.db.schema.MemberSchema
import kotlinx.coroutines.Dispatchers
import org.jetbrains.exposed.sql.*
import org.jetbrains.exposed.sql.transactions.experimental.newSuspendedTransaction
import org.jetbrains.exposed.sql.transactions.transaction

class DiaryService(
    private val database: Database
) {
    init {
        transaction(database) {
            addLogger(StdOutSqlLogger)
            SchemaUtils.create(Diary)
            SchemaUtils.create(Member)
        }
    }

    suspend fun <T> dbQuery(block: suspend () -> T): T =
        newSuspendedTransaction(Dispatchers.IO) { block() }

    suspend fun loadByDiaryId(id: Int):DiarySchema =
        dbQuery {
            Diary.join(Member, JoinType.INNER).select {
                Diary.id eq id
            }.map {
                println(it)
                DiarySchema(
                    subject = it[Diary.subject],
                    content = it[Diary.content]
                )
            }.single()
        }
}