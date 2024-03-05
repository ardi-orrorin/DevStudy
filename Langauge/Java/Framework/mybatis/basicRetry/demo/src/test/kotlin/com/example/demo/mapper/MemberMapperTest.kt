package com.example.demo.mapper

import com.example.demo.entity.Member
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.boot.test.mock.mockito.SpyBean

@SpringBootTest
class MemberMapperTest {
    @SpyBean
    private lateinit var memberMapper: MMember<Member>

    @Test
    fun selectAll() {
        for(i in 1..1000) {
            memberMapper.selectAll().size
        }
//        memberMapper.selectAll().size

    }

    @DisplayName("insert 한 개씩 1000번")
    @Test
    fun insertMember() {
        val member = Member(name = "test")
        for (i in 1..10000) {
            member.name = "test$i"
            memberMapper.insert(member)
        }
    }

    @DisplayName("insert 한 번에 1000개")
    @Test
    fun insertMember2() {
        for (i in 1..100) {
            val members = mutableListOf<Member>()
            for (j in 1..10000) {
                members.add(Member(name = "test$j"))
            }
            memberMapper.insertByList(members)
        }
//        val members = mutableListOf<Member>()
//        for (i in 1..10000) {
//            members.add(Member(name = "test$i"))
//        }
//        memberMapper.insertByList(members)
    }



}