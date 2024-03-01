package com.example.demo.service

import com.example.demo.controller.MemberController
import com.example.demo.entity.Member
import com.example.demo.entity.PageDTO
import com.example.demo.mapper.Common
import com.example.demo.mapper.MMember
import org.junit.jupiter.api.DisplayName
//import com.example.demo.repository.MemberRepository
import org.junit.jupiter.api.Test
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.boot.test.mock.mockito.MockBean
import org.springframework.boot.test.mock.mockito.SpyBean
import org.springframework.transaction.annotation.Transactional

@SpringBootTest

class MemberServiceTest {

//    @MockBean
    @SpyBean
    lateinit var mMember: MMember<Member>

    @SpyBean
    lateinit var common: Common

    @SpyBean
    lateinit var memberService: MemberService


    val log:Logger = LoggerFactory.getLogger(MemberService::class.java)

    @Test
    fun serviceSelectById(){
        val member = memberService.selectById(34026)
        log.info("member: $member")
    }

    @Test
    fun serviceSelectAll(){
        val members = memberService.selectAll()
        log.info("members: $members")
    }

    @Test
    fun serviceSelectByPage(){
        val page = PageDTO<Member>(size = 10, page= 1)
        val param = Member(name = "insert-1", birthday = "", email = "", address = "")
        val result = memberService.selectByPage(page, param)

        log.info("result: $result")
    }

    @Test
    fun serviceInsertList() {
        val members = mutableListOf<Member>()
        for(i in 1..531352) {
            val member = Member(
                name = "test-insert-$i", birthday = "20200811",
                email = "test.test.test@test.com"
            )
            members.add(member)
        }

        val result = memberService.insertByList(members)
        log.info("result: $result")

    }



    @Test
    fun selectAll() {
//        val members = mMember.selectAll()
//        log.info("members: $members")
//        log.info("members.size {}", members.size)
//        members.forEach { println(it) }

        var members = common.selectAll()
        log.info("member.size {}", members.size)

    }

    @Test
    fun selectById(id: Long = 1): Member {
        val member = mMember.selectById(id)
        member?.id == null && throw RuntimeException("member is null !!!!!")
        log.info("member: $member")
        return member
    }

    @Test
    @DisplayName("selectByType")
    fun selectByType() {
        val search = Member(id = null, name = "test", birthday = "", email = "", address = "")
        val result = mMember.selectByType(search)
        log.info("result: $result")
    }

    @Test
    fun selectByChoose() {
        val search = Member(id = null, name = "", birthday = "", email = "", address = "")
        val result = mMember.selectByChoose(search)
        log.info("result: $result")
    }

    @Test
    fun selectByList() {
        val list: List<Long> = listOf(1, 2, 3, 4, 5, 6, 7)
        val result = mMember.selectByList(list)
        log.info("result: $result")
    }

    @Test
//    @Transactional(readOnly = true)
    fun selectByPage(){
        val page = PageDTO<Member>(size = 10, page= 1)
        val param: Member = Member(name = "insert-1", birthday = "", email = "", address = "")
//        page.list = mMember.selectByPage(page = page, param)
//        pageR.list = mMember.selectByPage(page = page, param = null)
        page.list = mMember.selectByPage(page = page, param = param)
        page.total = mMember.totalSelect(param = param)
        page.javaClass.name

        log.info("member: $page")
    }

    @Test
//    @Transactional
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

    @Test
    fun listInsertTest(){
        for(i in 1..1000) {
            val member = Member(
                name = "test-insert-$i", birthday = "20200811",
                email = ""
            )
            mMember.insert(member);
        }
    }

    @Test
    fun insertByList(){
        val members = mutableListOf<Member>()
        for(i in 1..10000) {
            val member = Member(
                name = "test-insert-$i", birthday = "20200811",
                email = ""
            )
            members.add(member)
        }

        mMember.insertByList(members);
    }


    @Test
//    @Transactional
    fun updateById() {
//        val member = selectById(2)
//        member.name = "updateTest"
//
//        mMember.updateById(member)
//        log.info("member: $member")
//
//        val result = mMember.selectAll()
//        log.info("result: $result")

        val member = Member(
            id = 2, name = "updateTest", birthday = "20200811",
            email = "");
        mMember.updateById(member);

    }

    @Test
//    @Transactional
    fun deleteById() {
        val member = selectById(1)
        mMember.deleteById(member.id as Long)
        log.info("member: $member");
    }

    @Test
    fun fullInsert() {
        for(i in 1..10000) {
            val member = Member(
                name = "test$i", birthday = "20200811",
                email = ""
            )

            mMember.insert(member)
        }
    }

}