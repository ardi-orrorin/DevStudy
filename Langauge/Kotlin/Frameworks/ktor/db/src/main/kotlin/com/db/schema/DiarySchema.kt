package com.db.schema

import com.db.dao.Member
import kotlinx.serialization.Serializable

@Serializable
data class DiarySchema(
    val subject: String,
    val content: String,
//    val member: MemberSchema
)
