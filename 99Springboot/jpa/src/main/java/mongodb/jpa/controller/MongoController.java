package mongodb.controller;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import mongodb.dto.MongoDTO;
import mongodb.service.MongoService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RequiredArgsConstructor
@RestController
public class MongoController {

    private final MongoService mongoService;

    @GetMapping("/main")
    public String main(){
        return "main";
    }

    @GetMapping("/")
    public ResponseEntity<List<MongoDTO>> findAll(){
        System.out.println("1 = " + 1);
        List<MongoDTO> mongoList = mongoService.findAll();
        System.out.println("mongoList = " + mongoList);
        return ResponseEntity.ok(mongoList);
    }
}
