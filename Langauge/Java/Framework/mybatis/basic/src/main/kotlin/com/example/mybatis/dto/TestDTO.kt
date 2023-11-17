package com.example.mybatis.dto

import java.time.LocalDateTime


data class TestDTO(

    var id: Long? = null,

    var name: String? = null,

    var age: Int? = null,

    var email: String? = null,

    var createAt: LocalDateTime? = LocalDateTime.now(),

    var updateAt: LocalDateTime? = null,

    var deleteAt: LocalDateTime? = null,

)
