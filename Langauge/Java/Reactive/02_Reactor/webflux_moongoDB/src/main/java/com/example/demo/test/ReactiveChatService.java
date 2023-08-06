package com.example.demo.test;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import reactor.core.publisher.Flux;
import reactor.core.publisher.FluxSink;
import reactor.core.publisher.Mono;
import reactor.core.publisher.Sinks;

@Service
@RequiredArgsConstructor
public class ReactiveChatService {

    private final ReactiveChatRepository reactiveChatRepository;

//    private final ChatRepository chatRepository;


//    public Flux<Message> findAll(Mono<Integer> memberCode, Mono<Sort> sort){
//
//        return reactiveChatRepository.findAllByReceiveListContaining(
//                memberCode, sort);
//
//    }

    public Flux<Message> findAll(Integer memberCode, Mono<Sort> sort){

        return reactiveChatRepository.findAllByReceiveListContaining(
                memberCode, sort);

    }
    public Mono<Message> find(Integer memberCode, Mono<Sort> sort){

        return reactiveChatRepository.findFirstByReceiveListContaining(
                memberCode, sort);
//        return Mono.just(chatRepository.findFirstByReceiveListContaining(memberCode));
    }
}
