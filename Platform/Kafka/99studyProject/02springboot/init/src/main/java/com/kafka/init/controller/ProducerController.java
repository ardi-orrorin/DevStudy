package com.kafka.init.controller;

import lombok.RequiredArgsConstructor;
import org.apache.kafka.clients.admin.NewTopic;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.kafka.support.SendResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.concurrent.CompletableFuture;

@RestController
@RequestMapping("/kafka")
@RequiredArgsConstructor
public class ProducerController {

    private final KafkaTemplate<String , String> kafkaTemplate;
    private final NewTopic myTopic1;

    @GetMapping("/topic01")
    public String topic01(String message){
        CompletableFuture<SendResult<String ,String>> future = kafkaTemplate.send(myTopic1.name(), message);
        System.out.println("future = " + future);
        System.out.println("future = " + future.toString());
        return "done";
    }

}
