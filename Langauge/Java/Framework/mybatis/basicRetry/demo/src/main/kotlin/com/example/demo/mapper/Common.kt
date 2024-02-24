package com.example.demo.mapper

import com.example.demo.entity.Member
import org.apache.ibatis.annotations.Mapper

@Mapper
interface Common {
    fun selectAll(): List<Member>

}