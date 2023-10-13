package com.cache.caffeine.calendar.services


import com.cache.caffeine.calendar.dto.ScheduleDTO
import com.cache.caffeine.calendar.repository.ScheduleRepository
import org.modelmapper.ModelMapper
import org.springframework.stereotype.Service


@Service
class ScheduleService(
    private var scheduleRepository: ScheduleRepository,
    private var modelMapper: ModelMapper,
) {

    fun findAll(): List<ScheduleDTO> {
        return scheduleRepository.findAll()
            .map { modelMapper.map(it, ScheduleDTO::class.java) }
            .map {
                it.calendar?.scheduleList = null
                it
            }
    }
}