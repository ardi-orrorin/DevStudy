package com.kafka.init.dto;


import lombok.*;

import java.io.PipedReader;
import java.time.LocalDateTime;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class MessageDTO {

    private String room;

    private List<UserDTO> userList;

    private UserDTO sender;

    private UserDTO receiver;

    private String message;

    private LocalDateTime sendingDate;

}
