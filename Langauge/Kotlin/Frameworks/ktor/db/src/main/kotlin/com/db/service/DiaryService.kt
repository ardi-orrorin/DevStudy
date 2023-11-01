package com.db.service

import com.db.dao.Diary
import com.db.dao.Diary.nullable
import com.db.dao.Member
import com.db.schema.DiarySchema
import com.db.schema.MemberSchema
import kotlinx.coroutines.Dispatchers
import org.jetbrains.exposed.sql.*
import org.jetbrains.exposed.sql.statements.InsertStatement
import org.jetbrains.exposed.sql.transactions.experimental.newSuspendedTransaction
import org.jetbrains.exposed.sql.transactions.transaction
import java.time.Instant

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
                val member = MemberSchema(
                    userId = it[Member.userId],
                    email = it[Member.email],
                    createAt = it[Member.createAt].toString()
                )

                DiarySchema(
                    subject = it[Diary.subject],
                    content = it[Diary.content],
                    member = member,
                    createAt = it[Diary.createAt].toString(),
                    updateAt = it[Diary.updateAt.nullable()].toString(),
                    deleteAt = it[Diary.deleteAt.nullable()].toString()
                )
            }.single()
        }
    suspend fun loadByDiary(): List<DiarySchema> =
        dbQuery {
            Diary.selectAll()
                .orderBy(Diary.createAt, SortOrder.DESC)
                .distinct()
                .map {
                    DiarySchema(
                        subject = it[Diary.subject],
                        content = it[Diary.content],
                        createAt = it[Diary.createAt].toString(),
                        updateAt = it[Diary.updateAt.nullable()].toString(),
                        deleteAt = it[Diary.deleteAt.nullable()].toString()
                    )
                }
        }
    suspend fun insertByDiary(diary: DiarySchema, userId: String): InsertStatement<Number> =
        dbQuery {
            Diary.insert {
                val refMemberId = Member.select {
                    Member.userId eq userId
                }.map { MemberSchema(
                    userId = it[Member.userId],
                    id = it[Member.id].value,
                    email = "",
                    createAt = ""
                    )
                }.single()

                it[subject] = diary.subject
                it[content] = diary.content
                it[createAt] = Instant.now()
                it[member] = refMemberId.id!!
            }
        }
}