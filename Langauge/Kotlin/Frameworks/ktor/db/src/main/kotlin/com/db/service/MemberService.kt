package com.db.service

import com.db.dao.Member
import com.db.schema.MemberSchema
import kotlinx.coroutines.Dispatchers
import org.jetbrains.exposed.sql.Database
import org.jetbrains.exposed.sql.SchemaUtils
import org.jetbrains.exposed.sql.select
import org.jetbrains.exposed.sql.transactions.experimental.newSuspendedTransaction
import org.jetbrains.exposed.sql.transactions.transaction

class MemberService(
    private val database: Database
) {
    init {
        transaction(database) {
            SchemaUtils.create(Member)
        }
    }

    suspend fun <T> dbQuery(block: suspend () -> T): T =
        newSuspendedTransaction(Dispatchers.IO) { block() }

    suspend fun loadMemberId(userId: String): MemberSchema {
        println(userId)
        return dbQuery {
            Member.select {
                Member.userId eq userId
            }.map {
                MemberSchema(
                    it[Member.userId],
                    it[Member.userPwd],
                    it[Member.email]
                )
            }.single()
        }
    }
}