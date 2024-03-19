package com.example.webfluxtuto.dto;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
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
        @Max(value = 10, message = "id는 10보다 작아야 합니다.")
        @Min(value = 1, message = "id는 1보다 커야 합니다.")
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
