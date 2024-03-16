package com.example.webfluxtuto.controller;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.SpyBean;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.boot.test.web.server.LocalServerPort;
import org.springframework.http.MediaType;
import org.springframework.test.web.reactive.server.EntityExchangeResult;
import org.springframework.test.web.reactive.server.WebTestClient;
import org.springframework.web.util.DefaultUriBuilderFactory;
import org.springframework.web.util.UriBuilder;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
//@WebFluxTest(TestController.class)
//@ExtendWith(SpringExtension.class)
//@BootstrapWith(cont)
class TestControllerTest {

    @LocalServerPort
    private int port;

    @SpyBean
    private TestRestTemplate restTemplate;

    @SpyBean
    private WebTestClient webTestClient;

    private String URI;


    private Logger log = org.slf4j.LoggerFactory.getLogger(this.getClass());


    @BeforeEach
    public void init() {
        webTestClient = WebTestClient.bindToServer().baseUrl("http://localhost:" + port).build();
    }

    public void setUp() {
        this.URI = "http://localhost:" + port + "/test";
    }

    @Test
    void test1() {
        String result = this.restTemplate.getForObject("http://localhost:" + port + "/test/1", String.class);
        System.out.println(result);
    }

    @Test
    void test2() {
    }

    @Test
    void test3() {
        this.setUp();
        log.info("test3 : {}" , this.URI);

        UriComponents queryParam = UriComponentsBuilder.fromUriString(this.URI + "/3")
                .queryParam("test", "1,2,3,4")
                .build();

//        Map<String, String> queryParam = new HashMap<>();
//        queryParam.put("test", "1,2,3,4");

        String result = this.restTemplate.getForObject(queryParam.toUriString(), String.class, queryParam);
        System.out.println(result);
    }

    @Test
    void test3mockMvc() throws Exception {

//        java.net.URI uri2 = new DefaultUriBuilderFactory("/test/3")
//                .builder()
//                .queryParam("test", "1,2,3,4")
//                .build();
        EntityExchangeResult<ParamTest> result = webTestClient.get()
//                .uri(uri2)
                .uri(uriBuilder -> uriBuilder.path("/test/3")
                               .queryParam("test", "1,2,3,4")
                               .build()
                )
                .accept(MediaType.APPLICATION_JSON)
                .exchange()
                .expectStatus().isOk()
                .expectBody(ParamTest.class)
                .returnResult();

        log.info("result : {}", result);


//        log.info("result : {}", result.getResponse());
    }
}