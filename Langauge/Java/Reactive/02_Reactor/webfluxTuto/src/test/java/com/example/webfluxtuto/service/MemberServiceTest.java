package com.example.webfluxtuto.service;

import com.example.webfluxtuto.model.Member;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.SpyBean;
import reactor.core.publisher.Mono;
import reactor.core.scheduler.Schedulers;

import static org.junit.jupiter.api.Assertions.*;


@SpringBootTest
class MemberServiceTest {

    @SpyBean
    private MemberService memberService;


    private Logger log = org.slf4j.LoggerFactory.getLogger(this.getClass());

    @Test
    void findAll() {
        Mono<Member> member = Mono.just(Member.builder().build());

        memberService.findAll(member)
//                .publishOn(Schedulers.boundedElastic())
                .log()
                .subscribe();
    }

    @Test
    void insert() {
        Member member = Member.builder()
                .id(1)
                .age(20)
                .name("test")
                .birthday("210100")
                .build();

        memberService.insert(Mono.just(member))
                .log()
                .subscribe();
    }

}