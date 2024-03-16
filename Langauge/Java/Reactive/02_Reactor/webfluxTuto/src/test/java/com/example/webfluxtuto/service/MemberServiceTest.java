package com.example.webfluxtuto.service;

import com.example.webfluxtuto.dto.MemberRequest;
import com.example.webfluxtuto.dto.MemberResponse;
import com.example.webfluxtuto.mapper.MemberMapper;
import com.example.webfluxtuto.model.Member;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.SpyBean;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;
import reactor.core.scheduler.Schedulers;

import static org.junit.jupiter.api.Assertions.*;


@SpringBootTest
class MemberServiceTest {

    @SpyBean
    private MemberService memberService;

    @SpyBean
    private MemberMapper memberMapper;


    private Logger log = org.slf4j.LoggerFactory.getLogger(this.getClass());

    @Test
    void findAll() {
        Mono<MemberRequest.Member> member = Mono.just(MemberRequest.Member.builder().build());
//        member.flatMap(e->
//                Flux.fromIterable(memberMapper.findAll())
//                        .log()
//                        .map(f -> MemberResponse.Member.builder()
//                                .id(f.getId())
//                                .name(f.getName())
//                                .age(String.valueOf(f.getAge()))
//                                .birthDay(f.getBirthday())
//                                .build()
//                        )
//                        .collectList()
//        )
//                .log()
//                .subscribe();

        memberService.findAll(member)
//                .publishOn(Schedulers.boundedElastic())
                .log()
                .subscribe();
    }

    @Test
    void insert() {
        MemberRequest.Member member = MemberRequest.Member.builder()
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