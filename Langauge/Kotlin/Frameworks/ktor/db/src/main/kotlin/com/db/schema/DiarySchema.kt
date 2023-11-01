package com.db.schema

import com.db.dao.Member
import kotlinx.serialization.Serializable

@Serializable
data class DiarySchema(
    val subject: String,
    val content: String,
    val createAt: String,
    val updateAt: String? = null,
    val deleteAt: String? = null,
    val member: MemberSchema? = null,
)
