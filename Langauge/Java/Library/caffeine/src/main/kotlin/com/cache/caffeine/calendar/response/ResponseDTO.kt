package com.cache.caffeine.calendar.response

import java.time.LocalDateTime

data class ResponseDTO<T>(
    var status: Int?,
    var data: T?,
    var resTime: LocalDateTime? = LocalDateTime.now()
)
