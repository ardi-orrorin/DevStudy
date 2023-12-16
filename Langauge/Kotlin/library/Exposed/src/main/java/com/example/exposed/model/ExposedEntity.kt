@file:Suppress("InvalidPackageDeclaration")
package com.example.exposed.model

import org.jetbrains.exposed.dao.id.LongIdTable

object ExposedEntity: LongIdTable() {
    val userName = varchar("username", 255)
    val pwd = varchar("pwd", 255)
    val text = text("text")
}