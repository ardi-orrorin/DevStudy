package com.example.demo.controller

import com.example.demo.entity.Member
import com.example.demo.service.MemberService
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.Mapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/api/members")
class MemberController(
    private val memberService: MemberService
) {

    @GetMapping("/{id}")
    fun selectById(@PathVariable id: Long): ResponseEntity<Member> {
        return ResponseEntity.ok()
            .body(memberService.selectById(id))
    }
    @GetMapping
    fun selectAll(): ResponseEntity<List<Member>> {
        return ResponseEntity.ok()
            .body(memberService.selectAll())
    }
}