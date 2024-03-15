package com.example.webfluxtuto.controller;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;
import reactor.core.scheduler.Schedulers;

import java.time.Duration;
import java.util.List;

@RestController
@Slf4j
@RequestMapping("/test")
public class TestController {

    @GetMapping("/1")
    public Mono<List<String>> test(Mono<Param> param) {
        return Flux.range(1, 500000)
//                                .publishOn(Schedulers.boundedElastic())
                                .map(i -> i.toString())
                                .map(String::toUpperCase)
                                .map(i -> i + " : test")
                                .collectList();
    }

    @GetMapping("/2")
    public Mono<List<String>> test2(Mono<Param> param) {
        return param
//                .subscribeOn(Schedulers.boundedElastic())
                .flatMap(e -> Flux.range(1, 500000)
//                        .publishOn(Schedulers.boundedElastic())
                    .map(i -> i.toString())
                    .map(String::toUpperCase)
                    .map(i -> i + " : test")
                    .collectList()
                );

    }

    @Getter
    @Setter
    @ToString
    public static class Param {
        private int[] test;

    }
}
