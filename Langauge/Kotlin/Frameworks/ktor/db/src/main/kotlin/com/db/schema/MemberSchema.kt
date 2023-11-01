package com.db.schema

import kotlinx.serialization.Serializable
import org.jetbrains.exposed.dao.id.EntityID

@Serializable
data class MemberSchema(
    val id: Int? = null,
    val userId: String,
    val userPwd: String? = null,
    val email: String,
    val createAt: String
)
