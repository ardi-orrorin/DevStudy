package com.kafka.init.dto;

import lombok.*;

import java.util.List;

@ToString
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UserDTO {

    private String userId;

    private String username;

    private List<String> chatRoomList;
}
