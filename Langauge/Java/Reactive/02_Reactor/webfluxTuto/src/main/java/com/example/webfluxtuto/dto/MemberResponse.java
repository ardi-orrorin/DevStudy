package com.example.webfluxtuto.dto;


import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Builder
@ToString
@Setter
public class MemberResponse {

    private int code;
    private String message;


    @Getter
    @ToString
    @Builder
    @Setter
    public static class Member {
        private long id;
        private String name;
        private String age;
        private String birthDay;
    }
}
