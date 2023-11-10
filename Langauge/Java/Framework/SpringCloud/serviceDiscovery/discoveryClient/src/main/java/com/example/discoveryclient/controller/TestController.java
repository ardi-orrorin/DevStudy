package com.example.discoveryclient.controller;


import com.example.discoveryclient.DTO.DiaryDTO;
import com.example.discoveryclient.service.Dairy;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RequiredArgsConstructor
@RestController
public class TestController {
    
    private final Dairy dairy;

    private final DiaryFeignClient diaryFeignClient;

    @GetMapping("/test/{param}")
    public ResponseEntity<List<DiaryDTO>> test(
            @PathVariable String param
    ) {
        return ResponseEntity.ok(dairy.loadbalanceRestEmplate(param));
    }

    @GetMapping("/test1/{param}")
    public ResponseEntity<List<DiaryDTO>> test1(
            @PathVariable String param
    ) {
        return ResponseEntity.ok(dairy.getList(param));
    }

    @GetMapping("/test2/{param}")
    public ResponseEntity<List<DiaryDTO>> test2(
            @PathVariable String param
    ) {
        return ResponseEntity.ok(diaryFeignClient.getDiaris(param));
    }


}
