package com.example.demo.test;

import lombok.*;
import org.bson.types.ObjectId;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
import org.springframework.data.mongodb.core.mapping.MongoId;

import java.time.LocalDateTime;
import java.util.List;


@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
@Document(collection = "test2")
public class Message {

    @MongoId
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
