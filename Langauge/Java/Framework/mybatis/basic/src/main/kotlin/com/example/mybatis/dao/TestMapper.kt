package com.example.mybatis.dao

import com.example.mybatis.dto.TestDTO
import org.apache.ibatis.annotations.Mapper

@Mapper
interface TestMapper {

    fun selectByIdTest(id: Long): TestDTO?

    fun selectByUserIdTest(userId: String): List<TestDTO>

    fun selectAllTest(): List<TestDTO>

    fun insertTest(testDTO: TestDTO): Int

    fun updateTest(testDTO: TestDTO): Int

    fun deleteTest(testDTO: TestDTO): Int

    fun countTest(testDTO: TestDTO): Long
}