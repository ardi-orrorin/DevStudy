package com.example.demo.controller

//import com.example.demo.service.MemberService
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RestController

//import reactor.core.publisher.Flux


@RestController
class MemberController(
//    private val memberService: MemberService
) {

//    @GetMapping("/members")
//    fun selectAll(): ResponseEntity<Flux<Member>> {
//        return ResponseEntity.ok(memberService.selectAll())
//    }

    @GetMapping("/hello")
    fun helloWorld(): ResponseEntity<String> {
        return ResponseEntity.ok().body("hello world")
    }

    @GetMapping("/hello/params")
    fun helloWorld(member: MemberDTO): ResponseEntity<MemberDTO> {
        return ResponseEntity.ok().body(member)
    }

    @GetMapping("/hello/path/{id}")
    fun helloWorldPath(@PathVariable id: Long): ResponseEntity<Long> {
        return ResponseEntity.ok().body(id)
    }

    class MemberDTO {
        var id: Long? = 0
        var name: String? = ""
        var birthday: String? = ""
        var email: String? = ""
        var address: String? = ""
        var createAt: String? = null
        var updateAt: String? = null
    }
}