package com.example.exposed;

import kotlin.Suppress;
import org.jetbrains.exposed.spring.autoconfigure.ExposedAutoConfiguration;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.ImportAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@ImportAutoConfiguration(ExposedAutoConfiguration.class)
public class ExposedApplication {

    public static void main(String[] args) {
        SpringApplication.run(ExposedApplication.class, args);
    }

}
