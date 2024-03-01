package com.example.demo.controller

import com.example.demo.entity.Member
import com.example.demo.mapper.MMember
import com.example.demo.service.MemberService
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test
import org.mockito.Spy
import org.slf4j.Logger
import org.slf4j.LoggerFactory.getLogger
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest
import org.springframework.boot.test.mock.mockito.MockBean
import org.springframework.boot.test.mock.mockito.SpyBean
import org.springframework.test.web.servlet.MockMvc
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get
import org.springframework.util.LinkedMultiValueMap
import org.springframework.util.MultiValueMap


//@SpringBootTest
@WebMvcTest(MemberController::class)
class MemberControllerTest {

    @SpyBean
    lateinit var mvc: MockMvc

    @SpyBean
    lateinit var memberService: MemberService

    @SpyBean
    lateinit var mMember: MMember<Member>

    val log: Logger = getLogger(this::class.java)

    @DisplayName("select by id test")
    @Test
    fun selectById() {
        val result = mvc.perform(get("/api/members/1/sdfds"))
            .andExpect { log.info("result: ${it.response.contentAsString}") }
            .andDo { log.info("result: ${it.response.contentAsString}") }
            .andReturn()


//        log.info("result: ${result.response.contentAsString}")
    }

    @DisplayName("hello world test")
    @Test
    fun helloWorld() {
//        memberController.helloWorld()
        val result = mvc.perform(get("/hello"))
//            .andExpect(status().isOk)
//            .andExpect(jsonPath("$.data").value("hello world"))
            .andExpect { log.info("result: ${it.asyncResult}") }
            .andReturn()

//        log.info("result: ${result.response}")

//            .andExpect(status().isOk)
//            .andExpect()
    }

    @DisplayName("hello world params test")
    @Test
    fun helloWorldParams() {

        val params: MultiValueMap<String, String> = LinkedMultiValueMap<String, String>()
            .apply {
                add("name", "test")
                add("birthday", "2021-01-01")
                add("email", "")
            }


        val result = mvc.perform(
            get("/hello/params")
//                .param("name", "test")
                .params(params)
            ).andReturn()


        log.info("result: ${result.response.contentAsString}")
    }

    @DisplayName("hello world path test")
    @Test
    fun helloWorldPath() {
        val result = mvc.perform(get("/hello/path/1"))
            .andReturn()

        log.info("result: ${result.response.contentAsString}")
    }




}
