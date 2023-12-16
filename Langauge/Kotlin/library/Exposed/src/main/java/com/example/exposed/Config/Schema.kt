@file:Suppress("InvalidPackageDeclaration")

package com.example.exposed.Config

import com.example.exposed.model.ExposedEntity
import org.jetbrains.exposed.sql.SchemaUtils
import org.springframework.boot.ApplicationArguments
import org.springframework.boot.ApplicationRunner
import org.springframework.stereotype.Component
import org.springframework.transaction.annotation.Transactional

@Component
@Transactional
open class Schema: ApplicationRunner {
    override fun run(args: ApplicationArguments?) {
        SchemaUtils.create(ExposedEntity)
    }
}