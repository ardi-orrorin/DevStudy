package com.example.exposed.model

import org.jetbrains.exposed.dao.id.IdTable
import org.jetbrains.exposed.sql.Table.Dual.autoIncrement
import org.jetbrains.exposed.sql.Table.Dual.integer
import org.jetbrains.exposed.sql.Table.Dual.text
import org.jetbrains.exposed.sql.Table.Dual.varchar

object Exposed: IdTable() {
    val id = integer("id").autoIncrement()
    val name = varchar("username", 255)
    val pwd = varchar("pwd", 255)
    val text = text("text")
}