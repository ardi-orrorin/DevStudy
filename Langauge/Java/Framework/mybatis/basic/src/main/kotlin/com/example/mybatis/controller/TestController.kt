package com.example.mybatis.controller

import com.example.mybatis.dto.ResponeDTO
import com.example.mybatis.dto.TestDTO
import com.example.mybatis.service.TestService
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*

@RequestMapping("/test")
@RestController
class TestController(
    val testService: TestService
) {

    @GetMapping("/all")
    fun selectAllTest() = testService.selectAllTest()

    @GetMapping("{id}")
    fun selectTest(
        @PathVariable id: Long
    ) = testService.selectTest(id)

    @GetMapping("/user/{userId}")
    fun selectByUserIdTest(
        @PathVariable userId: String
    ): ResponseEntity<ResponeDTO<List<TestDTO>>> {
        val tests: List<TestDTO> = testService.selectByUserIdTest(userId)
        val count: Long = tests.size.toLong()
        val message: String = HttpStatus.OK.name
        val status: Int = HttpStatus.OK.value()
        return ResponseEntity.ok(ResponeDTO(count, tests, message, status))
    }

    @PostMapping("/insert")
    fun insertTest(
        @RequestBody testDTO: TestDTO
    ) = testService.insertTest(testDTO)

    @PutMapping("/update")
    fun updateTest(
        @RequestBody testDTO: TestDTO
    ) = testService.updateTest(testDTO)

    @DeleteMapping("/delete/{id}")
    fun deleteTest(
        @PathVariable id: Long
    ) {
        val testDTO = TestDTO(id = id)
        testService.deleteTest(testDTO)
    }

}