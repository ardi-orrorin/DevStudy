package com.kafka.init.controller;

import com.kafka.init.dto.MessageDTO;
import com.kafka.init.dto.UserDTO;
import lombok.RequiredArgsConstructor;
import org.apache.kafka.clients.admin.NewTopic;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.kafka.support.SendResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.concurrent.CompletableFuture;

@RestController
@RequestMapping("/kafka")
@RequiredArgsConstructor
public class ProducerController {

    private final KafkaTemplate<String , MessageDTO> kafkaTemplate;
    private final NewTopic myTopic1;

    @GetMapping("/topic01")
    public String topic01(){
        UserDTO user01 = UserDTO.builder().userId("user01").username("유저01").build();
        UserDTO user02 = UserDTO.builder().userId("user02").username("유저02").build();

        MessageDTO message = MessageDTO.builder()
                .room("test").sender(user01).message("user01-test")
                .userList(Arrays.asList(user01,user02)).sendingDate(LocalDateTime.now()).build();

        CompletableFuture<SendResult<String ,MessageDTO>> future = kafkaTemplate.send(myTopic1.name(), message);
        System.out.println("future = " + future);
        System.out.println("future = " + future.toString());
        return "done";
    }

}
