package com.example.mybatis.dto

import org.springframework.security.core.userdetails.UserDetails
import java.time.LocalDateTime

data class MemberDTO(

    var id: Long? = null,

    var userId: String? = null,

    var password: String? = null,

    var createAt: LocalDateTime = LocalDateTime.now(),

    var updateAt: LocalDateTime? = null,

    var deleteAt: LocalDateTime? = null,

    var testList: MutableList<TestDTO> = mutableListOf()
)