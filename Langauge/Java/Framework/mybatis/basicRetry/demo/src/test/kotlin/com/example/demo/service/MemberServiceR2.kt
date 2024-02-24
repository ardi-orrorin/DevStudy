//package com.example.demo.service
//
//import com.example.demo.entity.Member
////import com.example.demo.repository.MemberRepository
//import org.junit.jupiter.api.Test
//import org.slf4j.Logger
//import org.slf4j.LoggerFactory
//import org.springframework.beans.factory.annotation.Autowired
//import org.springframework.boot.test.context.SpringBootTest
//import reactor.test.StepVerifier
//import java.time.LocalDateTime
//
//@SpringBootTest
////@WebFluxTest(MemberServiceR2::class)
//class MemberServiceR2 {
//    @Autowired
//    lateinit var memberRepository: MemberRepository
//
//    val log: Logger = LoggerFactory.getLogger(this::class.java)
//
//    @Test
////    @Transactional(readOnly = true)
//    fun selectAll() {
//        val members = memberRepository.findAll()
//
////        StepVerifier.create(members)
////            .assertNext { member -> log.info(member.name) }
//
////        StepVerifier.create(members)
////            .expectNext(null)
////            .verifyComplete()
////            .expectComplete()
//
//
//    }
////        members.subscribe {
////            log.info("members: $it")
////        }
//
////        members.subscribe {
////            log.info("members: $it")
////        }
////        members.doOnNext {
////            it.subscribe { member ->
////
////                log.info(member.name)
////            }
////        }
//
////        members.publish()
//}