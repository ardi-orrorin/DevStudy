package com.cache.caffeine.calendar.controller

import com.cache.caffeine.calendar.dto.ScheduleDTO
import com.cache.caffeine.calendar.response.ResponseDTO
import com.cache.caffeine.calendar.services.ScheduleService
import lombok.extern.slf4j.Slf4j
import org.springframework.cache.annotation.CacheEvict
import org.springframework.cache.annotation.Cacheable
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@Slf4j
class ScheduleController(
    private var scheduleService: ScheduleService,

) {

    @GetMapping("/schedule")
    @Cacheable(cacheNames = ["schedule"])
    fun findAll(): ResponseEntity<ResponseDTO<List<ScheduleDTO>>>  {
        return ResponseEntity.ok(
            ResponseDTO(HttpStatus.OK.value(), scheduleService.findAll())
        )
    }

    @GetMapping("/delete")
    @CacheEvict("schedule")
    fun delete() = ResponseEntity.ok("delete cache")
}