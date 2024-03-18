package com.example.webfluxtuto.controller;


import io.netty.handler.logging.LoggingHandler;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.io.buffer.DataBuffer;
import org.springframework.http.MediaType;
import org.springframework.http.codec.multipart.FilePart;
import org.springframework.http.codec.multipart.Part;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import java.util.List;
import java.util.concurrent.Exchanger;

@RestController
@Slf4j
@RequestMapping("/test")
public class TestController {

    @GetMapping("/1")
    public Mono<List<String>> test(Mono<ParamTest> param) {
        return Flux.range(1, 500000)
                   .map(String::valueOf)
                   .map(String::toUpperCase)
                   .map(i -> i + " : test")
                   .collectList();
    }

    @GetMapping("/2")
    public Mono<List<String>> test2(Mono<ParamTest> param) {
        return param.flatMap(e -> Flux.range(1, 500000)
                    .map(String::valueOf)
                    .map(String::toUpperCase)
                    .map(i -> i + " : test")
                    .collectList()
                );
    }

    @GetMapping("/3")
    public Mono<ParamTest> test3(Mono<ParamTest> param) {
        param.log();
        return param;
    }

    @PostMapping(value = "/4" , consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public void test4(
            @RequestPart("file") FilePart file,
            @RequestPart("dto") Dto dto
    ) {

        log.info("dto: {}", dto);
//        log.info("param: {}", param.filename());
//        log.info("param: {}", param.headers().getContentType());
//        param.log().subscribe();
//        param.get("param").forEach(e -> {
//            log.info("log: {}", );
//        });
//        param.subscribe();

//        param.get("param");

    }

    @Getter
    @Setter
    @ToString
    public static class Dto {
        private String fileName;
//        private FilePart file;
    }

}
