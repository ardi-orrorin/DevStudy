package com.example.demo.entity

import org.apache.ibatis.type.Alias
import java.time.LocalDateTime


//@Alias(value = "Member")
data class Member(
    val id: Long? = 0,
    var name: String,
    val birthday: String,
    var email: String? = "",
    var address: String? = "",
    var createAt: LocalDateTime? = null,
    var updateAt: LocalDateTime? = null
)
