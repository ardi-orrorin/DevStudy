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

    @GetMapping("/list")
    public ResponseEntity<List<Diary>> list() {
        return ResponseEntity.ok(diaryService.findAll());
    }

}
