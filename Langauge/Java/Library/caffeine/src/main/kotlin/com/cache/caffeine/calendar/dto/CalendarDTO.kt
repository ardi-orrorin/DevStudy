package com.cache.caffeine.calendar.dto


import java.time.LocalDateTime


data class CalendarDTO(

    var id: Int? = 0,

    var name: String? = null,

    var openStatus: Boolean? = null,

    var labelColor: String? = null,

    var indexNo: Int? = null,

    var memberCode: Int? = null,

    var defaultCalendar: Boolean? = null,

    var departmentCode: Int? = null,

    var createDate: LocalDateTime? = null,

    var scheduleList: MutableList<ScheduleDTO>? = ArrayList()

) {
    override fun toString(): String {
        return "Calendar(id=$id, name=$name, openStatus=$openStatus, labelColor=$labelColor, indexNo=$indexNo, memberCode=$memberCode, defaultCalendar=$defaultCalendar, departmentCode=$departmentCode, createDate=$createDate, scheduleList=$scheduleList)"
    }
}