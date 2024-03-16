package com.example.webfluxtuto.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class MemberRequest {

    @Getter
    @Setter
    @ToString
//    @Builder
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
    @Builder
    public static class MemberIdList {
        private long[] id;
    }
}
