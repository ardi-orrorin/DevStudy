package com.example.webfluxtuto.controller;


import com.example.webfluxtuto.dto.MemberRequest;
import com.example.webfluxtuto.dto.MemberResponse;
import com.example.webfluxtuto.model.Member;
import com.example.webfluxtuto.service.MemberService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/members")
public class MemberController {
    private final MemberService memberService;

    @GetMapping
    public Mono<List<MemberResponse.Member>> findAll(@Valid Mono<MemberRequest.Member> member) {
        return memberService.findAll(member);
    }

    @PostMapping
    public Mono<MemberResponse.Member> insert(@RequestBody Mono<MemberRequest.Member> member) {
        return memberService.insert(member);
    }

    @DeleteMapping
    public Mono<MemberRequest.MemberIdList> delete(Mono<MemberRequest.MemberIdList> members) {
        return memberService.delete(members);
    }


}
