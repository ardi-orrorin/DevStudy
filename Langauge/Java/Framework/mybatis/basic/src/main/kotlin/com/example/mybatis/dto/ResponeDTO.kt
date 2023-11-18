package com.example.mybatis.dto


data class ResponeDTO<T>(
    val count: Long,
    val data: T,
    val message: String,
    val status: Int,
)
