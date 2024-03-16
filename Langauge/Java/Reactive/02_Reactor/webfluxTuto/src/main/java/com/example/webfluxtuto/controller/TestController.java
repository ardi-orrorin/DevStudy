package com.example.webfluxtuto.controller;


import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import java.util.List;

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

}
