package com.example.mybatis.service

import com.example.mybatis.dao.TestMapper
import com.example.mybatis.dto.TestDTO
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

@Service
class TestService(
    val testMapper: TestMapper
) {
    fun countTest(testDTO: TestDTO): Long = testMapper.countTest(testDTO)

    fun selectTest(id: Long) = testMapper.selectByIdTest(id)

    fun selectByUserIdTest(userId: String) = testMapper.selectByUserIdTest(userId)

    @Transactional
    fun selectAllTest() = testMapper.selectAllTest()

    @Transactional
    fun insertTest(testDTO: TestDTO) = testMapper.insertTest(testDTO)

    @Transactional
    fun updateTest(testDTO: TestDTO) = testMapper.updateTest(testDTO)

    @Transactional
    fun deleteTest(testDTO: TestDTO) = testMapper.deleteTest(testDTO)

}