package com.example.demo.test;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Sort;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.server.ServerRequest;
import org.springframework.web.reactive.function.server.ServerResponse;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import java.util.List;


@Component
@RequiredArgsConstructor
public class ChatHandler {

    private final ReactiveChatService reactiveChatService;

    public Mono<ServerResponse> reacitveFindAllMessage(ServerRequest request){
        Integer userId = Integer.valueOf(request.pathVariable("userId")) ;
        System.out.println("userId = " + userId);
        Mono<Sort> sort = Mono.just(Sort.by(Sort.Direction.DESC, "createDate"));
        Flux<Message> messageFlux =
                reactiveChatService.findAll(userId,sort);

        Mono<Message> messageMono = reactiveChatService.find(userId,sort);

        return ServerResponse.ok()
                .body(messageMono, Message.class);

    }
}
