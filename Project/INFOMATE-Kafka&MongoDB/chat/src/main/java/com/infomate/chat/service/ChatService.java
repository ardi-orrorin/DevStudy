package com.infomate.chat.service;

import com.infomate.chat.controller.ChatController;
import com.infomate.chat.dto.MessageDTO;
import com.infomate.chat.entity.Message;
import com.infomate.chat.repository.ChatRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class ChatService {

    private final ChatRepository chatRepository;

    private final ModelMapper modelMapper;

    public void insertMessage(MessageDTO message) {
        log.info("[ChatService](insertMessage) message : {}", message);
        Message messageEntity = modelMapper.map(message, Message.class);
        log.info("[ChatService](insertMessage) message : {}", messageEntity);
        chatRepository.save(messageEntity);
        log.info("[ChatService](insertMessage) message : {}", messageEntity);
    }
}
