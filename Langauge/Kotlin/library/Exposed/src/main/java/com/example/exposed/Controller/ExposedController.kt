@file:Suppress("InvalidPackageDeclaration")
package com.example.exposed.Controller

import com.example.exposed.Services.ExposedService
import com.example.exposed.model.Exposed
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RequestMapping("/exposed")
@RestController
class ExposedController(
    private val exposedService: ExposedService
) {

    @GetMapping("/all")
    fun findAllExposed() = exposedService.findAllExposed()

    @PostMapping("/create")
    fun createExposed(
        @RequestBody exposed: Exposed
    ) = exposedService.createExposed(exposed = exposed)

    @PostMapping("/update/{id}")
    fun updateExposed(
        @RequestBody exposed: Exposed, @PathVariable id: Long
    ) = exposedService.updateExposed(id = id, exposed = exposed)

    @PostMapping("/delete/{id}")
    fun deleteExposed(
        @PathVariable id : Long
    ) = exposedService.deleteExposed(id = id)
}