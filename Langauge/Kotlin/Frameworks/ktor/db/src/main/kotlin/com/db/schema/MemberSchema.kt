package com.db.schema

import kotlinx.serialization.Serializable

@Serializable
data class MemberSchema(
    val userId: String,
    val userPwd: String,
    val email: String,
)
