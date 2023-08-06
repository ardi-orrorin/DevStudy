package com.example.demo.test;

import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.boot.autoconfigure.http.codec.CodecsAutoConfiguration;
import org.springframework.boot.autoconfigure.web.reactive.ReactiveWebServerFactoryAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.reactive.function.server.RouterFunction;
import org.springframework.web.reactive.function.server.ServerResponse;

import static org.springframework.web.reactive.function.server.RouterFunctions.route;

@Configuration
@AutoConfigureAfter({ReactiveWebServerFactoryAutoConfiguration.class, CodecsAutoConfiguration.class})
public class ChatRouter {

    @Bean
    public RouterFunction<ServerResponse> chatRouterV3(ChatHandler chatHandler){
        return route()
                .GET("/chat/{userId}",chatHandler::reacitveFindAllMessage)
                .build();
    }
}
