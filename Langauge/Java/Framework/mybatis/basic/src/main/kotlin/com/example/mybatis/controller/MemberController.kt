package com.example.mybatis.controller

import com.example.mybatis.dto.MemberDTO
import com.example.mybatis.service.MemberService
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.security.crypto.password.PasswordEncoder
import org.springframework.web.bind.annotation.DeleteMapping
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.PutMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/member")
class MemberController(
    val memberService: MemberService,
    val passwordEncoder: PasswordEncoder,
) {

    @GetMapping("/all")
    fun findAllMember() = memberService.findAllMember()

    @PostMapping("/insert")
    fun insertMember(@RequestBody memberDTO: MemberDTO): Boolean {
        memberDTO.password = passwordEncoder.encode(memberDTO.password)
        memberService.insertMember(memberDTO)
        return true
    }

    @PutMapping("/update")
    fun updateMember(@RequestBody memberDTO: MemberDTO) = memberService.updateMember(memberDTO)

    @DeleteMapping("/delete/{userId}")
    fun deleteMember(@PathVariable userId: String) {
        val memberDTO = MemberDTO(userId = userId)
        memberService.deleteMember(memberDTO)
    }
}