package com.example.cloudhamony;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@RefreshScope
@EnableEurekaServer
public class CloudHamonyApplication {

    public static void main(String[] args) {
        SpringApplication.run(CloudHamonyApplication.class, args);
    }

}
