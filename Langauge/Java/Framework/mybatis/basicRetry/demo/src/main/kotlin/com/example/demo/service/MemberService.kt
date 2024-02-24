//package com.example.demo.service
//
//import com.example.demo.entity.Member
//import com.example.demo.repository.MemberRepository
//import org.springframework.stereotype.Service
//import reactor.core.publisher.Flux
//
//
//@Service
//class MemberService(
//     private val memberRepository: MemberRepository
//) {
//
//    fun selectAll(): Flux<Member> {
//        return memberRepository.findAll()
//    }
//}