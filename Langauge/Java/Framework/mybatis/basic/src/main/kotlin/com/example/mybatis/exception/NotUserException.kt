package com.example.mybatis.exception

class NotUserException(
    override val message: String?
): RuntimeException() {
}