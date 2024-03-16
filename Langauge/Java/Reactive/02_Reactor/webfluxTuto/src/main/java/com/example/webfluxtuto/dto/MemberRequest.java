package com.example.webfluxtuto.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

public class MemberRequest {

    @Getter
    @Setter
    @ToString
    @Builder
    public static class Member {
        private long id;
        private String name;
        private int age;
        private String birthday;
    }

    @Getter
    @Setter
    @ToString
    @Builder
    public static class MemberIdList {
        private long[] id;
    }
}
