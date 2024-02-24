package com.example.demo.repository

import com.example.demo.entity.Member
import org.springframework.data.r2dbc.repository.R2dbcRepository
import org.springframework.stereotype.Repository

@Repository()
interface MemberRepository: R2dbcRepository<Member, Long> {

}