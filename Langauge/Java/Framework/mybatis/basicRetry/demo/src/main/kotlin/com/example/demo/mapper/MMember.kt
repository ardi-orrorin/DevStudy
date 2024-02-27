package com.example.demo.mapper

import com.example.demo.entity.Member
import org.apache.ibatis.annotations.Mapper
//import reactor.core.publisher.Flux

@Mapper
interface MMember {
//    fun selectAll(): List<Member>
    fun selectAll(): List<Member>
    fun selectById(id: Long): Member
    fun selectByList(list: List<Long>): List<Member>
    fun selectByChoose(member: Member): List<Member>
    fun selectByType(member: Member): List<Member>
    fun insert(member: Member)
    fun updateById(member: Member)
    fun deleteById(id: Long)

}