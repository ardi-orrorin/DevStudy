package com.example.demo.controller

import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test
import org.slf4j.Logger
import org.slf4j.LoggerFactory.getLogger
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

//    @SpyBean
//    lateinit var memberController: MemberController

    @SpyBean
//    @Autowired
    lateinit var mvc: MockMvc

    val log: Logger = getLogger(this::class.java)

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
