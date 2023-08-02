package com.infomate.chat.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.criteria.CriteriaBuilder;
import lombok.*;
import org.bson.types.ObjectId;
import org.springframework.data.mongodb.core.annotation.Collation;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

import java.time.LocalDateTime;
import java.util.List;


//@Collation(value = "test1")
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
@Document(collection = "test2")
public class Message {

    @Id
    private ObjectId id;

    @Field(name = "sender")
    private int sender;

    @Field(name = "chatRoomNo")
    private int chatRoomNo;

    @Field(name = "receiveList")
    private List<Integer> receiveList;

    @Field(name = "createDate")
    private LocalDateTime createDate;

    @Field(name = "message")
    private Object message;

}
