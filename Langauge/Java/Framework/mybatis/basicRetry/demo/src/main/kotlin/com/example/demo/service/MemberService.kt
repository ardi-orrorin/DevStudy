package com.example.demo.service

import com.example.demo.entity.Member
import com.example.demo.entity.PageDTO
import com.example.demo.mapper.Common
import com.example.demo.mapper.MMember
import org.slf4j.Logger
import org.slf4j.LoggerFactory
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional


@Service
class MemberService(
    private val mMember: MMember<Member>,
    private var common: Common
){

    val log: Logger = LoggerFactory.getLogger(MemberService::class.java)

    @Transactional(readOnly = true)
    fun selectAll(): List<Member> {
        var members = common.selectAll()
        log.info("member.size {}", members.size)
        return members
    }

    @Transactional(readOnly = true)
    fun selectById(id: Long?): Member {
        id == null && throw RuntimeException("id is null !!!!!")
        val member = mMember.selectById(id!!)
        member == null && throw RuntimeException("member is null !!!!!")
        return member
    }

    @Transactional(readOnly = true)
    fun selectByType(member: Member): List<Member> {
        return mMember.selectByType(member)
    }

    @Transactional(readOnly = true)
    fun selectByChoose(member: Member): List<Member> {
        return mMember.selectByChoose(member)
    }

    @Transactional(readOnly = true)
    fun selectByList(list: List<Long>): List<Member> {
        return mMember.selectByList(list)
    }

    @Transactional(readOnly = true)
    fun selectByPage(page: PageDTO<Member>, param: Member): PageDTO<Member> {
        page.list  = mMember.selectByPage(page = page, param = param)
        page.total = mMember.totalSelect(param = param)
        return page
    }

    @Transactional
    fun insert(member: Member): String {
        if(member.birthday.length != 8) {
            RuntimeException("birthday length is not 8")
            return "birthday length is not 8";
        }

        val result:Int = mMember.insert(member);
        return if(result == 1) "success" else "fail"
    }

    @Transactional
    fun insertByList(members: List<Member>):String {

        val limit  = 10000 // 쿼리 텍스트 길이 제한으로 인해 5000개씩 나눠서 insert
        var result = 0
        if(members.size > limit) {
            for(i in 0..(members.size / limit)) {
                val start = i * limit
                val end   = if((i + 1) * limit > members.size) members.size else (i + 1) * limit
                mMember.insertByList(members.subList(start, end))
                result++
            }
        } else {
            mMember.insertByList(members)
            result++
        }

        val total = if(members.size > limit) members.size / limit else 1

        return if(result == total) "success" else "fail"
    }


    @Transactional
    fun updateById(member: Member):String {
       val result:Int = mMember.updateById(member)
       return if(result == 1) "success" else "fail"
    }

    @Transactional
    fun updateByList(members: List<Member>):String {
        val result:Int = mMember.updateByList(members)
        return if(result == 1) "success" else "fail"
    }


    @Transactional
    fun deleteById(id: Int):String {
        val member     = selectById(id.toLong())
        val result:Int = mMember.deleteById(member.id as Long)
        return if(result == 1) "success" else "fail"
    }

}