package com.example.demo.entity

data class BoardDTO(
    var id        : Long     = 0,
    var title     : String   = "",
    var content   : String   = "",
    var createAt  : Long     = System.currentTimeMillis(),
    var updateAt  : Long?    = 0,
    var deleteAt  : Long?    = 0,
    var member    : Member?  = null,
)
