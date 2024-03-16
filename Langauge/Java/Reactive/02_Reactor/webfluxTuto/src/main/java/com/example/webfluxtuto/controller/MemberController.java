package com.example.webfluxtuto.controller;


import com.example.webfluxtuto.dto.MemberResponse;
import com.example.webfluxtuto.model.Member;
import com.example.webfluxtuto.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import reactor.core.publisher.Mono;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/member")
public class MemberController {
    private final MemberService memberService;

    @GetMapping
    public Mono<List<MemberResponse.Member>> findAll(Mono<Member> member) {
        return memberService.findAll(member);
    }

    @PostMapping
    public Mono<MemberResponse.Member> insert(@RequestBody Mono<Member> member) {
        return memberService.insert(member);
    }
}
