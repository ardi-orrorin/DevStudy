package com.example.webfluxtuto.service;

import com.example.webfluxtuto.dto.MemberResponse;
import com.example.webfluxtuto.exception.QueryException;
import com.example.webfluxtuto.mapper.MemberMapper;
import com.example.webfluxtuto.model.Member;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import java.sql.SQLException;
import java.util.List;

@Service
@RequiredArgsConstructor
public class MemberService {
    private final MemberMapper memberMapper;

    public Mono<List<MemberResponse.Member>> findAll(Mono<Member> member) {

        return member.flatMap(e->
            Flux.fromIterable(memberMapper.findAll())
                .map(f -> MemberResponse.Member.builder()
                            .id(f.getId())
                            .name(f.getName())
                            .age(String.valueOf(f.getAge()))
                            .birthDay(f.getBirthday())
                            .build()
                )
                .collectList()
        );
    }

    public Mono<MemberResponse.Member> insert(Mono<Member> member) {

        return member.doOnNext(this::vaildation)
                     .flatMap(e->
                         Mono.just(memberMapper.insert(e))
                                 .map(g -> MemberResponse.Member.builder()
                                         .id(e.getId())
                                         .name(e.getName())
                                         .age(String.valueOf(e.getAge()))
                                         .birthDay(e.getBirthday())
                                         .build()
                                 )
                     );
    }

    private Member vaildation(Member member) {
        if (member.getName() == null || member.getName().isEmpty()) {
            throw new QueryException("name is empty");
        }
        if (member.getAge() == 0) {
            throw new QueryException("age is 0");
        }
        if (member.getBirthday() == null || member.getBirthday().isEmpty()) {
            throw new QueryException("birthday is empty");
        }
        if (member.getBirthday().length() != 6) {
            throw new QueryException("birthday length is not 6");
        }
        return member;
    }

    private MemberResponse createResponse(int result) {
        return MemberResponse.builder()
                .code(200)
                .message("success")
                .build();

    }


}
