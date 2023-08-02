package com.infomate.chat.repository;

import com.infomate.chat.entity.Message;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface ChatRepository extends MongoRepository<Message, Integer> {
}
