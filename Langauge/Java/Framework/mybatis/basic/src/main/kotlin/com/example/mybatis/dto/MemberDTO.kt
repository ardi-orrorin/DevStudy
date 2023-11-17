package com.example.mybatis.dto

import java.time.LocalDateTime

data class MemberDTO(

    val id: Long? = null,

    val userId: String? = null,

    val password: String? = null,

    val createAt: LocalDateTime = LocalDateTime.now(),

    val updateAt: LocalDateTime? = null,

    val deleteAt: LocalDateTime? = null,

    val testList: List<TestDTO> = listOf()
)
