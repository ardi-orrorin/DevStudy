package com.example.mybatis.dao

import com.example.mybatis.dto.MemberDTO
import org.apache.ibatis.annotations.Mapper

@Mapper
interface MemberMapper {

//    fun selectMember(): MemberDTO?

    fun selectAllMember(): List<MemberDTO>

    fun insertMember(member: MemberDTO): Int

    fun updateMember(member: MemberDTO): Int

    fun deleteMember(member: MemberDTO): Int

    fun selectByUserId(userId: String): MemberDTO?
}