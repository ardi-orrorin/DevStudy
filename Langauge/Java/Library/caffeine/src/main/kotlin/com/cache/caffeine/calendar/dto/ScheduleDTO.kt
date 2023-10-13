package com.cache.caffeine.calendar.dto

import java.time.LocalDateTime

data class ScheduleDTO(
    var id: Int? = 0,

    var title: String? = null,

    var startDate: LocalDateTime? = null,

    var endDate: LocalDateTime? = null,

    var content: String? = null,

    var address: String? = null,

    var allDay: Boolean? = null,

    var corpSchdl: Boolean? = null,

    var repeat: Boolean? = null,

    var important: Boolean? = null,

    var refCalendar: Int? = null,

    var calendar: CalendarDTO? = null

) {

    override fun toString(): String {
        return "ScheduleDTO(id=$id, title=$title, startDate=$startDate, endDate=$endDate, content=$content, address=$address, allDay=$allDay, corpSchdl=$corpSchdl, repeat=$repeat, important=$important, refCalendar=$refCalendar, calendar=$calendar)"
    }

    
}
