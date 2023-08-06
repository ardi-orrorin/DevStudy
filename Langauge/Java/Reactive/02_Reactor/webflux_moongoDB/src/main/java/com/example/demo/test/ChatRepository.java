//package com.example.demo.test;
//
//import org.bson.types.ObjectId;
//import org.springframework.data.domain.Sort;
//import org.springframework.data.mongodb.repository.MongoRepository;
//
//import java.time.LocalDateTime;
//import java.util.List;
//
//public interface ChatRepository extends MongoRepository<Message, ObjectId> {
//
//
//    Message findFirstByReceiveListContaining(Integer memberCode);
//    List<Message> findAllByReceiveListContaining(List<Integer> receiveList, Sort sort);
//
//    List<Message> findAllByChatRoomNoAndCreateDateBetween(Integer roomId, LocalDateTime beforeDate, LocalDateTime afterDate);
//}
