package com.kafka.init.controller;
import com.jayway.jsonpath.internal.function.sequence.First;
import com.kafka.init.dto.MessageDTO;
import com.kafka.init.dto.TestDTO;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.apache.kafka.clients.admin.NewTopic;
import org.springframework.context.event.EventListener;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.kafka.support.SendResult;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.messaging.simp.broker.SimpleBrokerMessageHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.messaging.SessionConnectEvent;
import org.springframework.web.socket.messaging.SessionDisconnectEvent;

import java.util.concurrent.CompletableFuture;


@RestController
@RequiredArgsConstructor
public class GreetingController {

    private final KafkaTemplate<String , MessageDTO> kafkaTemplate;
    private final NewTopic myTopic1;

    private final SimpMessageSendingOperations simpMessageSendingOperations;
    
    @EventListener
    public void webSocketConnect(SessionConnectEvent event){
        System.out.println("event = " + event);
    }
    
    @EventListener
    public void webSocketDisConnect(SessionDisconnectEvent event){
        System.out.println("event = " + event);
    }

    @MessageMapping("/message/{room}") // setApplicationDestinationPrefixes
//    @SendTo("/sub/topic/{id}") // enableSimpleBroker
    public void message(@DestinationVariable String room, MessageDTO message){
        message.setRoom(room);
        System.out.println("message = " + message);
        CompletableFuture<SendResult<String ,MessageDTO>> future =
                kafkaTemplate.send(myTopic1.name(), message);
    }

    @KafkaListener(topics = "topic01" ,groupId = "foo")
    public void subMessage(MessageDTO messageDTO){
        System.out.println("messageDTO = " + messageDTO);

        simpMessageSendingOperations.convertAndSend("/sub/message/"+messageDTO.getRoom(),messageDTO);
    }



}
