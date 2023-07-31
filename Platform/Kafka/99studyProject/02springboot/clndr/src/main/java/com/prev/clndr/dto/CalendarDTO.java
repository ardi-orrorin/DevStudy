package com.prev.clndr.dto;

import lombok.*;

import java.time.LocalDateTime;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Calendar {
    private int id;
    private String title;
    private LocalDateTime startDate;
    private LocalDateTime endDate;
    private String content;
    private boolean allDay;
    private boolean corpSched;

}
