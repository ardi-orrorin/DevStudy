@file:Suppress("InvalidPackageDeclaration")
package com.example.exposed.Services

import com.example.exposed.model.Exposed
import com.example.exposed.model.ExposedEntity
import com.example.exposed.model.Id
import org.jetbrains.exposed.sql.*
import org.jetbrains.exposed.sql.SqlExpressionBuilder.eq
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.stereotype.Component
import org.springframework.transaction.annotation.Transactional

@Component
@Transactional
open class ExposedService {
    private val log: Logger = LoggerFactory.getLogger(this::class.java)
    open fun findAllExposed(): List<Exposed> {
        println("ExposedService.findAllExposed")
        val exposedList : List<Exposed> = ExposedEntity.selectAll()
            .limit(100).copy()
            .mapNotNull {
                Exposed(
                    id = Id(it[ExposedEntity.id].value),
                    userName = it[ExposedEntity.userName],
                    pwd = it[ExposedEntity.pwd],
                    text = it[ExposedEntity.text]
                )
        }
        return exposedList
    }


    open fun createExposed(exposed: Exposed): Exposed {
        val id = ExposedEntity.insertAndGetId {
            it[userName] = exposed.userName
            it[pwd] = exposed.pwd
            it[text] = exposed.text
        }

        return exposed.copy(id = Id(id.value))
    }


    open fun updateExposed(id: Long, exposed: Exposed): Unit {
        ExposedEntity.update {
            this.id eq id
            it[userName] = exposed.userName
            it[pwd] = exposed.pwd
            it[text] = exposed.text
        }
    }

    open fun deleteExposed(id: Long): Unit {
        ExposedEntity.deleteWhere {
            this.id eq id
        }
    }


}
