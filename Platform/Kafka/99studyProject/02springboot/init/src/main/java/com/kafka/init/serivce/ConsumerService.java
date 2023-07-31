package com.kafka.init.serivce;

import com.kafka.init.dto.MessageDTO;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.stereotype.Service;

@Service
public class ConsumerService {

    @KafkaListener(topics = "topic01" ,groupId = "foo")
    public void consumerTopic01(@Payload MessageDTO message
    ){
        System.out.println("message = " + message);
    }

}
