package com.example.webfluxtuto.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class MemberRequest {

    @Getter
    @Setter
    @ToString
    public static class Member {
        private long id;
        private String name;
        private int age;
        private String birthday;

        public Member(){
            this.birthday = LocalDate.now().format(DateTimeFormatter.ofPattern("yyMMdd"));
        }

    }

    @Getter
    @Setter
    @ToString
    public static class MemberIdList {
        private long[] id;
    }
}
