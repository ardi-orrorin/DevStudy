package mongodb.jpa.controller;

import lombok.RequiredArgsConstructor;
import mongodb.jpa.dto.MongoDTO;
import mongodb.jpa.service.MongoService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

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
        List<MongoDTO> mongoList = mongoService.findAll();
        System.out.println("mongoList = " + mongoList);
        return ResponseEntity.ok(mongoList);
    }
}
