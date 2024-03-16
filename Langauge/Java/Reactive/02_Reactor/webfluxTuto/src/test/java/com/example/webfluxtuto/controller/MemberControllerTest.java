package com.example.webfluxtuto.controller;

import com.example.webfluxtuto.dto.MemberResponse;
import com.example.webfluxtuto.model.Member;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.springframework.boot.test.autoconfigure.web.reactive.WebFluxTest;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.server.LocalServerPort;
import org.springframework.http.MediaType;
import org.springframework.test.web.reactive.server.EntityExchangeResult;
import org.springframework.test.web.reactive.server.WebTestClient;
import org.springframework.util.MultiValueMap;
import org.springframework.util.MultiValueMapAdapter;

import java.util.HashMap;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;


@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
//@WebFluxTest(MemberController.class)
class MemberControllerTest {

    @LocalServerPort
    private int port;

    private WebTestClient webTestClient;

    private Logger log = org.slf4j.LoggerFactory.getLogger(this.getClass());

    @BeforeEach
    public void init() {
        webTestClient = WebTestClient.bindToServer().baseUrl("http://localhost:" + port).build();
    }

    @Test
    void findAll() {

        MultiValueMap<String, String> queryParam = new MultiValueMapAdapter<>(new HashMap<>());
        queryParam.add("id", "1");
        queryParam.add("name", "test");
        queryParam.add("age", "20");
        queryParam.add("birthday", "20210101");


        EntityExchangeResult<List<MemberResponse.Member>> result =
        webTestClient.get()
                .uri(uriBuilder -> uriBuilder.path("/members")
                        .queryParams(queryParam)
//                        .queryParam("id", "1")
//                        .queryParam("name", "test")
//                        .queryParam("age", "20")
//                        .queryParam("birthday", "2021-01-01")
                        .build())
                .accept(MediaType.APPLICATION_JSON)
                .exchange()
                .expectStatus().isOk()
                .expectBodyList(MemberResponse.Member.class)
                .returnResult();

        log.info("result: {}", result);
    }

    @Test
    void insert() {

        Member member = Member.builder()
//                              .id(1)
                              .age(20)
                              .name("test111")
                              .birthday("210111")
                              .build();

        EntityExchangeResult<MemberResponse.Member> result =
        webTestClient.post()
                .uri("/members")
                .contentType(MediaType.APPLICATION_JSON)
                .bodyValue(member)
                .accept(MediaType.APPLICATION_JSON)
                .exchange()
                .expectStatus().isOk()
                .expectBody(MemberResponse.Member.class)
                .returnResult();

        log.info("result: {}", result);
    }

    @Test
    void delete() {
        EntityExchangeResult result =
        webTestClient.delete()
                .uri(uriBuilder -> uriBuilder.path("/members")
                        .queryParam("id", "173")
                        .queryParam("id", "172")
                        .queryParam("id", "171")
                        .queryParam("id", "170")
                        .build())
//                .accept(MediaType.APPLICATION_JSON)
                .exchange()
                .expectStatus().isOk()
                .expectBody()
                .returnResult();

        log.info("result: {}", result);
    }
}