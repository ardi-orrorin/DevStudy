package com.example.demo.test;

import lombok.*;

import java.time.LocalDateTime;
import java.util.List;


@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class MessageDTO {

    private int sender;

    private int chatRoomNo;

    private List<Integer> receiveList;

    private LocalDateTime createDate;

    private Object message;

}
