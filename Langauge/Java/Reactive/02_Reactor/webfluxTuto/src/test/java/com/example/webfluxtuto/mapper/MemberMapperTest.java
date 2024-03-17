package com.example.webfluxtuto.mapper;

import com.example.webfluxtuto.dto.MemberRequest;
import com.example.webfluxtuto.model.Member;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.slf4j.Logger;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.SpyBean;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;
import reactor.core.scheduler.Schedulers;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.time.temporal.TemporalAmount;
import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;


@SpringBootTest
class MemberMapperTest {

    @SpyBean
    private MemberMapper memberMapper;

    private Logger log = org.slf4j.LoggerFactory.getLogger(this.getClass());

    @Test
    void findAll() {
        log.info("{}", memberMapper.findAll());

    }

    @Test
    void insert() {
        MemberRequest.Member member = new MemberRequest.Member();
//        MemberRequest.Member member = MemberRequest.Member.builder()
//                .id(1)
//                .age(20)
//                .name("test")
//                .birthday("210101")
//                .build();

        log.info("{}", memberMapper.insert(member));
//        memberMapper.insert(member);

    }

    @Test
    void delete() {
//        MemberRequest.MemberIdList memberIdList = MemberRequest.MemberIdList.builder()
//                .id(new long[]{20, 23, 26})
//                .build();
//
//        memberMapper.delete(memberIdList.getId());
    }

    @Test
    void insertAll(){
        List<MemberRequest.Member> list = new ArrayList<>();

        for (int i = 0; i < 9; i++) {
            MemberRequest.Member member = new MemberRequest.Member();
            member.setAge(i);
            member.setName("test" + i);
            member.setBirthday("21010" + i);
            list.add(member);
        }

        log.info("{}", list);


        memberMapper.insertAll(list);

//        Flux.fromIterable(list)
//                .parallel()
//                .runOn(Schedulers.parallel())
//                .publishOn(Schedulers.parallel())
//                .log()
//                .doOnNext(e-> memberMapper.insert(e))
//                .doOnNext(e-> memberMapper.insert(e))
//                .collectList()
//                .log()
//                .subscribe();

    }

    @Test
//    @Disabled
    void test(){
        String str = "200801";
        LocalDate parse = LocalDate.parse(str, java.time.format.DateTimeFormatter.ofPattern("yyMMdd"));
        log.info("{}", parse);
        log.info("{}", parse.minus(1, ChronoUnit.MONTHS));
    }
}