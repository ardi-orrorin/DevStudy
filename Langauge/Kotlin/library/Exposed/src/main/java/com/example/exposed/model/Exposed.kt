@file:Suppress("InvalidPackageDeclaration")
package com.example.exposed.model

data class Exposed (
    val id: Id = Id(0),
    val userName: String = "",
    val pwd: String = "",
    val text: String = ""
)

@JvmInline
value class Id(val id: Long)