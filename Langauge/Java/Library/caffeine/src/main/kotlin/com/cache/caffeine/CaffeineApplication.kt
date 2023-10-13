package com.cache.caffeine

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.cache.annotation.EnableCaching

@EnableCaching
@SpringBootApplication
class CaffeineApplication

fun main(args: Array<String>) {
    runApplication<CaffeineApplication>(*args)
}
