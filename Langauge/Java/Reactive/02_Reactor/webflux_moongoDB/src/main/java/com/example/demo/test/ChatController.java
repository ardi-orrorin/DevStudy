package com.example.demo.test;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.config.EnableMongoAuditing;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

@RestController
@RequiredArgsConstructor
@Slf4j
public class ChatController {

    private final ReactiveChatService reactiveChatService;



    @GetMapping(value = "/chat1/{userId}")
    public Mono<Message> reacitveFindAllMessage(@PathVariable Integer userId){
        Mono<Sort> sort = Mono.just(Sort.by(Sort.Direction.DESC, "createDate"));
        return reactiveChatService.find(userId, sort);
    }
}
