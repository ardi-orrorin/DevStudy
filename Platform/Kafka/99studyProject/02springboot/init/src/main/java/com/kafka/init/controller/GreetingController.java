package com.kafka.init.controller;
import com.kafka.init.dto.TestDTO;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

@Controller
public class GreetingController {

    @MessageMapping("/message")
//    @SendTo("/pub/message")
    public TestDTO message(TestDTO message){
        System.out.println("message = " + message);
        return message;
    }
}
