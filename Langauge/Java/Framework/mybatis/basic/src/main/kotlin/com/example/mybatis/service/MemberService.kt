package com.example.mybatis.service

import com.example.mybatis.dao.MemberMapper
import com.example.mybatis.dto.MemberDTO
import org.springframework.stereotype.Service


@Service
class MemberService(
    val memberMapper: MemberMapper
) {

    fun findAllMember() = memberMapper.selectAllMember()

    fun insertMember(member: MemberDTO) = memberMapper.insertMember(member)

    fun updateMember(member: MemberDTO) = memberMapper.updateMember(member)

    fun deleteMember(member: MemberDTO) = memberMapper.deleteMember(member)

}