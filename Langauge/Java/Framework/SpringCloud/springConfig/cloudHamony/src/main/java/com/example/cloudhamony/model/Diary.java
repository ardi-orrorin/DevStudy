package com.example.cloudhamony.model;


import lombok.*;

import java.time.LocalDateTime;

//@Entity
//@Table(name = "TBL_DIARY")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Diary {

//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    @Column(name = "ID")
    private Long id;

//    @Column(name = "SUBJECT", nullable = false)
    private String subject;

//    @Column(name = "CONTENT", nullable = false)
    private String content;

//    @Column(name = "CREATEAT", nullable = false)
    private LocalDateTime createAt;

//    @Column(name = "UPDATEAT", nullable = true)
    private LocalDateTime updateAt;

//    @Column(name = "DELETEAT", nullable = true)
    private LocalDateTime deleteAt;
}
