package com.example.demo.test;

import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.mongodb.repository.config.EnableMongoRepositories;
import org.springframework.data.mongodb.repository.config.EnableReactiveMongoRepositories;

@Configuration
@ComponentScan(basePackages = "com.example.demo")
@EnableReactiveMongoRepositories(basePackages = "com.example.demo")
@EntityScan(basePackages = "com.example.demo")
//@EnableMongoRepositories(basePackages = "com.example.demo")
public class Config {

}
