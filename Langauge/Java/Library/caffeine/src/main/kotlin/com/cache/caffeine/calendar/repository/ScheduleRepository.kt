package com.cache.caffeine.calendar.repository


import com.cache.caffeine.calendar.entity.Schedule
import org.springframework.cache.annotation.CacheConfig
import org.springframework.cache.annotation.Cacheable
import org.springframework.data.jpa.repository.JpaRepository
interface ScheduleRepository: JpaRepository<Schedule, Int> {

}