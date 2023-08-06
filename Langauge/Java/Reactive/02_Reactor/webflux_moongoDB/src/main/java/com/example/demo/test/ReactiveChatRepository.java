package com.example.demo.test;


import org.bson.types.ObjectId;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.repository.ReactiveMongoRepository;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

public interface ReactiveChatRepository extends ReactiveMongoRepository<Message, ObjectId> {

//    Flux<Message> findAllByReceiveListContaining(Mono<Integer> membercode, Mono<Sort> sort);
    Flux<Message> findAllByReceiveListContaining(Integer membercode, Mono<Sort> sort);

    Mono<Message> findFirstByReceiveListContaining(Integer memberCode, Mono<Sort> sort);
}
