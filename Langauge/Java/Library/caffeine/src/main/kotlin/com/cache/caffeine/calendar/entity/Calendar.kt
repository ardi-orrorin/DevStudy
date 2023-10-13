package com.cache.caffeine.calendar.entity


import jakarta.persistence.*
import org.hibernate.annotations.DynamicInsert
import org.hibernate.annotations.DynamicUpdate
import org.springframework.data.annotation.Id
import java.time.LocalDateTime

@Entity
@DynamicUpdate
@DynamicInsert
@Table(name = "TBL_CLNDR")
@SequenceGenerator(
    name = "SEQ_TBL_CLNDR_GEN",
    sequenceName = "SEQ_TBL_CLNDR_CLNDR_CODE",
    initialValue = 1, allocationSize = 1
)
class Calendar(

    @jakarta.persistence.Id @Id
    @Column(name =  "CLNDR_CODE")
    @GeneratedValue(
        strategy = GenerationType.SEQUENCE,
        generator = "SEQ_TBL_CLNDR_GEN"
    )
    var id: Int?,

    @Column(name =  "CLNDR_NAME")
    var name: String?,

    @Column(name =  "OPEN_STATUS")
    var openStatus: Boolean?,

    @Column(name =  "LABEL_COLOR")
    var labelColor: String?,

    @Column(name =  "INDEX_NUM")
    var indexNo: Int?,

    @Column(name =  "REF_MEMBER_CODE")
    var memberCode: Int?,

    @Column(name =  "DEFAULT_SELC")
    var defaultCalendar: Boolean?,

    @Column(name =  "DPRMT_CODE")
    var departmentCode: Int?,

    @Column(name =  "CREATE_DATE")
    var createDate: LocalDateTime?,

    @OneToMany(mappedBy = "calendar")
    var scheduleList: MutableList<Schedule> = ArrayList()

) {
    override fun toString(): String {
        return "Calendar(id=$id, name=$name, openStatus=$openStatus, labelColor=$labelColor, indexNo=$indexNo, memberCode=$memberCode, defaultCalendar=$defaultCalendar, departmentCode=$departmentCode, createDate=$createDate, scheduleList=$scheduleList)"
    }
}