package com.example.cloudhamony.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/")
public class DiaryController {

    @Value("${spring.datasource.url}")
    private String url;

    @GetMapping
    public String url() {
        return url;
    }
}
