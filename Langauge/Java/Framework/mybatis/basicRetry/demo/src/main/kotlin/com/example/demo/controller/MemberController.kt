package com.example.demo.controller

import com.example.demo.entity.Member
import com.example.demo.service.MemberService
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController
import reactor.core.publisher.Flux


@RestController
class MemberController(
    private val memberService: MemberService
) {

    @GetMapping("/members")
    fun selectAll(): ResponseEntity<Flux<Member>> {
        return ResponseEntity.ok(memberService.selectAll())
    }


}