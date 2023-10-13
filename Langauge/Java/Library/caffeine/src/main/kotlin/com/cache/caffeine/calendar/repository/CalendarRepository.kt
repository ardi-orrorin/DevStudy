package com.cache.caffeine.calendar.repository


import com.cache.caffeine.calendar.entity.Calendar
import org.springframework.data.jpa.repository.JpaRepository

interface CalendarRepository: JpaRepository<Calendar, Int> {
}