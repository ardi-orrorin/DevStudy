package com.example.discoveryclient.controller;

import com.example.discoveryclient.DTO.DiaryDTO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@FeignClient(name = "hamony") // 서비스 명
public interface DiaryFeignClient {

//    @RequestMapping(
//            method = RequestMethod.GET,
//            value = "/diary/{param}",
//            consumes = "application/json"
//    )
    @GetMapping("/diary/{param}")
    List<DiaryDTO> getDiaris(@PathVariable("param") String param);

}
