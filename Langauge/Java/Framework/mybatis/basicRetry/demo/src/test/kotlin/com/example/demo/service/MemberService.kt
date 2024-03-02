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
import java.sql.Time

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
        for(i in 1..20) {
            var members = mutableListOf<Member>()
            for(j in 1..100202) {
                val member = Member(
                    name = "test-insert-$i", birthday = "20200811",
                    email = "test.test.test@test.com"
                )
                members.add(member)
            }

            val result = memberService.insertByList(members)
            log.info("result: $result")

        }
    }

    @Test
    fun serviceSelectByList(){

        val list: List<Long> = listOf(
            3923492, 3923493, 3923494, 3923495, 3923496,
            3923497, 3923498, 3923499, 3923500, 3923501,
            3923502, 3923503, 3923504, 3923505, 3923506,
            3923507, 3923508, 3923509, 3923510, 3923511,
            3923512, 3923513, 3923514, 3923515, 3923516,
            3923517, 3923518, 3923519, 3923520, 3923521,
            3923522, 3923523, 3923524, 3923525, 3923526,
            3923527, 3923528, 3923529, 3923530, 3923531,
            3923532, 3923533, 3923534, 3923535, 3923536,
            3923537, 3923538, 3923539, 3923540, 3923541,
            3923542, 3923543, 3923544, 3923545, 3923546,
            3923547, 3923548, 3923549, 3923550, 3923551,
            3923552, 3923553, 3923554, 3923555, 3923556,
            3923557, 3923558, 3923559, 3923560, 3923561,
            3923562, 3923563, 3923564, 3923565, 3923566,
            3923567, 3923568, 3923569, 3923570,
            1,2,3,4,5,6
        )
        val result = memberService.selectByList(list)

        log.info("result: $result")
        val isExist = result.filter { list.find { id -> id == it.id } != null }
        log.info("isExist: $isExist")
        val notExist = list.filter { result.find { member -> member.id == it } == null }
        log.info("notExist: $notExist")

        val updateMember = isExist.map {
            it.address = ""
            it
        }
        log.info("updateMember: $updateMember")

        memberService.updateByList(updateMember);
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