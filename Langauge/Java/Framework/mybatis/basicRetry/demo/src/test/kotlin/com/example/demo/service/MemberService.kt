package com.example.demo.service

import com.example.demo.entity.Member
import com.example.demo.mapper.MMember
import org.junit.jupiter.api.Test
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.context.SpringBootTest

@SpringBootTest
class MemberService {

    @Autowired
    lateinit var mMember: MMember

    val log:Logger = LoggerFactory.getLogger(MemberService::class.java)

    @Test
    fun contextLoads() {
        val members = mMember.selectAll()
        log.info("members: $members")
        log.info("members.size")
        members.forEach { println(it) }
    }

    @Test
    fun insert() {
        var member = Member(
            name = "test", birthday = "20200811",
            email = "test@test.com", address = "test",
        )

        if(member.birthday.length != 8) {
            log.info("birthday length is not 8")
            RuntimeException("birthday length is not 8")
            return
        }

        mMember.insert(member);
        log.info("member: $member")

        val result = mMember.selectAll()
        log.info("result: $result")

    }

}