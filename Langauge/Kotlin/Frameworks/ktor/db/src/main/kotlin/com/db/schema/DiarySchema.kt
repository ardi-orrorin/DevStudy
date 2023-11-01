package com.db.schema

import com.db.dao.Member
import kotlinx.serialization.Serializable

@Serializable
data class DiarySchema(
    val id: Int? = null,
    val subject: String,
    val content: String,
    val createAt: String? = null,
    val updateAt: String? = null,
    val deleteAt: String? = null,
    val member: MemberSchema? = null,
)
