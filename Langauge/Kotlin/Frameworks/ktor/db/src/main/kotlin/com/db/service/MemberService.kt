package com.db.service

import com.db.dao.Member
import com.db.schema.MemberSchema
import kotlinx.coroutines.Dispatchers
import org.jetbrains.exposed.sql.*
import org.jetbrains.exposed.sql.transactions.experimental.newSuspendedTransaction
import org.jetbrains.exposed.sql.transactions.transaction

class MemberService(
    private val database: Database
) {
    init {
        transaction(database) {
            addLogger(StdOutSqlLogger)
            SchemaUtils.create(Member)
        }
    }

    suspend fun <T> dbQuery(block: suspend () -> T): T =
        newSuspendedTransaction(Dispatchers.IO) { block() }

    suspend fun loadMemberId(userId: String): MemberSchema =
         dbQuery {
            Member.select {
                Member.userId eq userId
            }.map {
                println("df: " + it)
                MemberSchema(
                    userId = it[Member.userId],
                    email = it[Member.email],
                    createAt = it[Member.createAt].toString()
                )
            }.single()
        }

}