package com.example.webfluxtuto.mapper;

import com.example.webfluxtuto.model.Member;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.SpyBean;

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
        Member member = Member.builder()
                .id(1)
                .age(20)
                .name("test")
                .birthday("210101")
                .build();

        log.info("{}", memberMapper.insert(member));
//        memberMapper.insert(member);

    }
}