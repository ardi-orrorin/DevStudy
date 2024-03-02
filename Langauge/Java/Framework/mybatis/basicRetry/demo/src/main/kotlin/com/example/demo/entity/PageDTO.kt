package com.example.demo.entity

data class PageDTO<T> (
    var page     : Int      = 0,
    var size     : Int      = 0,
    var offset   : Int      = page * size,
    var total    : Int?     = 0,
    var list     : List<T>  = listOf()
)