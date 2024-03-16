package com.example.webfluxtuto.service;

import com.example.webfluxtuto.dto.MemberRequest;
import com.example.webfluxtuto.dto.MemberResponse;
import com.example.webfluxtuto.exception.ParameterException;
import com.example.webfluxtuto.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;
import reactor.core.scheduler.Schedulers;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MemberService {
    private final MemberMapper memberMapper;

    public Mono<List<MemberResponse.Member>> findAll(Mono<MemberRequest.Member> member) {
        return member
            .subscribeOn(Schedulers.parallel())
            .flatMap(e->
                Flux.fromIterable(memberMapper.findAll())
//                    .log()
                    .publishOn(Schedulers.boundedElastic())
//                    .log()
                    .map(f -> (
                        MemberResponse.Member.builder()
                            .id(f.getId())
                            .name(f.getName())
                            .age(String.valueOf(f.getAge()))
                            .birthDay(f.getBirthday())
                            .build()
                    ))
//                    .log()
                    .publishOn(Schedulers.parallel())
//                    .log()
                    .collectList()

        )
        .publishOn(Schedulers.parallel());

//        return member.map(e->
//                memberMapper.findAll().stream()
//                    .map(f -> MemberResponse.Member.builder()
//                            .id(f.getId())
//                            .name(f.getName())
//                            .age(String.valueOf(f.getAge()))
//                            .birthDay(f.getBirthday())
//                            .build()
//                    )
//                    .toList()
//
//        );

    }

    public Mono<MemberResponse.Member> insert(Mono<MemberRequest.Member> member) {
        return member.subscribeOn(Schedulers.boundedElastic())
                     .log()
                     .publishOn(Schedulers.parallel())
                     .doOnNext(this::isValidParameter)
                     .log()
                     .flatMap(e->
                         Mono.just(memberMapper.insert(e))
                             .publishOn(Schedulers.parallel())
                             .log()
                             .map(g ->
                                 MemberResponse.Member.builder()
                                     .id(e.getId())
                                     .name(e.getName())
                                     .age(String.valueOf(e.getAge()))
                                     .birthDay(e.getBirthday())
                                     .build()
                             )
                             .log()
                     );
    }


    public Mono<MemberRequest.MemberIdList> delete(Mono<MemberRequest.MemberIdList> members) {

        return members.doOnNext(e-> {
            if (e.getId().length > 0) {
                memberMapper.delete(e.getId());
            } else {
                throw new ParameterException("id is empty");
            }
        });
    }

    private void isValidParameter(MemberRequest.Member member) {
        if (member.getName() == null || member.getName().isEmpty()) {
            throw new ParameterException("name is empty");
        }
        if (member.getAge() == 0) {
            throw new ParameterException("age is 0");
        }
        if (member.getBirthday() == null || member.getBirthday().isEmpty()) {
            throw new ParameterException("birthday is empty");
        }
        if (member.getBirthday().length() != 6) {
            throw new ParameterException("birthday length is not 6");
        }
    }

    private MemberResponse createResponse(int result) {
        return MemberResponse.builder()
                .code(200)
                .message("success")
                .build();

    }


}
