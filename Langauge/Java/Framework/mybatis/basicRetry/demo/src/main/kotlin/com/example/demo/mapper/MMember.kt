package com.example.demo.mapper

import com.example.demo.entity.Member
import com.example.demo.entity.PageDTO
import org.apache.ibatis.annotations.Mapper
import org.apache.ibatis.annotations.Param

//import reactor.core.publisher.Flux

@Mapper
interface MMember<T> {
//    fun selectAll(): List<Member>

    fun totalSelect(@Param("param") param: T?): Int

    fun selectAll(): List<T>

    fun selectById(id: Long): T

    fun selectByList(list: List<Long>): List<T>

    fun selectByChoose(member: T): List<T>

    fun selectByType(member: T): List<T>

    fun selectByPage(@Param("page") page: PageDTO<T>?, @Param("param") param: T?): List<T>

    fun insert(member: T): Int

    fun insertByList(members: List<T>): Int

    fun updateById(member: T): Int

    fun deleteById(id: Long): Int

}