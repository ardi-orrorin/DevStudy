package com.example.cloudhamony;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.context.config.annotation.RefreshScope;

@SpringBootApplication
public class CloudHamonyApplication {

    public static void main(String[] args) {
        SpringApplication.run(CloudHamonyApplication.class, args);
    }

}
