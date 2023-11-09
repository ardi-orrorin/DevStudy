package com.example.cloudhamony.controller;

import com.example.cloudhamony.model.Diary;
import com.example.cloudhamony.service.DiaryService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/diary")
@RequiredArgsConstructor
public class DiaryController {

    private final DiaryService diaryService;

    @Value("${example.test}")
    private String test;

    @GetMapping("/list")
    public ResponseEntity<List<Diary>> list() {
        System.out.println(test);
        return ResponseEntity.ok(diaryService.findAll());
    }

}
