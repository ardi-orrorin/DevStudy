package com.example.webfluxtuto.model;


import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@Builder
public class Member {
    long id;
    String name;
    int age;
    String birthday;
}
