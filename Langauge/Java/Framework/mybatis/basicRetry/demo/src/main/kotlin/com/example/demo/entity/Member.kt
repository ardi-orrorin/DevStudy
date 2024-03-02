package com.example.demo.entity

//import org.springframework.data.relational.core.mapping.Table
import java.time.LocalDateTime


//@Table(value = "MEMBER")
data class Member(
    val id         : Long?          = 0,
    var name       : String         = "",
    val birthday   : String         = "",
    var email      : String?        = "",
    var address    : String?        = "",
    var createAt   : LocalDateTime? = LocalDateTime.now(),
    var updateAt   : LocalDateTime? = LocalDateTime.now()
)
