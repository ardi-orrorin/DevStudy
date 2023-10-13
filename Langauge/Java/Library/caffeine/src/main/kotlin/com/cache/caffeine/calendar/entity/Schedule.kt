package com.cache.caffeine.calendar.entity

import jakarta.persistence.*
import org.hibernate.annotations.DynamicInsert
import org.hibernate.annotations.DynamicUpdate
import java.time.LocalDateTime

@Entity
@Table(name = "TBL_SCHDL")
@DynamicInsert
@DynamicUpdate
@SequenceGenerator(
    name = "SEQ_TBL_SCHDL_GEN",
    sequenceName = "SEQ_TBL_SCHDL_SCHDL_ID",
    initialValue = 1, allocationSize = 1
)
class Schedule(
    @Id
    @Column(name = "SCHDL_ID")
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_TBL_SCHDL_GEN")
    var id: Int?,

    @Column(name = "TITLE")
    var title: String?,

    @Column(name = "START_DATE")
    var startDate: LocalDateTime?,

    @Column(name = "END_DATE")
    var endDate: LocalDateTime?,

    @Column(name = "CONTENT")
    var content: String?,

    @Column(name = "ADDRESS")
    var address: String?,

    @Column(name = "ALL_DAY")
    var allDay: Boolean?,

    @Column(name = "COPR_SCHDL")
    var corpSchdl: Boolean?,

    @Column(name = "REPEAT")
    var repeat: Boolean?,

    @Column(name = "IMPORTANT")
    var important: Boolean?,

    @Column(name = "REF_CLNDR_ID")
    var refCalendar: Int?,

    @ManyToOne(fetch = FetchType.LAZY, cascade = arrayOf(CascadeType.PERSIST) )
    @JoinColumn(name = "REF_CLNDR_ID", updatable = false, insertable = false)
    var calendar: Calendar?
    ) {

    override fun toString(): String {
        return "Schedule(id=$id, title=$title, startDate=$startDate, endDate=$endDate, content=$content, address=$address, allDay=$allDay, corpSchdl=$corpSchdl, repeat=$repeat, important=$important, refCalendar=$refCalendar)"
    }
}