package com.example.demo.dto

enum class ResultType(val value: Int, val msg:String) {
    FAIL(0, "Fail"),
    SUCCESS(1, "Success")
}