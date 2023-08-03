package com.study.async.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import java.util.concurrent.Executor;

@Configuration
@EnableAsync
public class AsyncConfig {

    @Bean
    public Executor asyncThreadPool(){
        ThreadPoolTaskExecutor taskExecutor = new ThreadPoolTaskExecutor();
        taskExecutor.setCorePoolSize(3); // 코어 쓰레드 개수
        taskExecutor.setMaxPoolSize(30); // 쓰레드 풀의 최대 사이즈
        taskExecutor.setQueueCapacity(10); // 쓰레드 풀 큐의 사이즈, CorePoolSize 개수를 넘어서는 task가 들어왔을 대 queue에 해당 하는 task들이 쌓이게 된다.
        taskExecutor.setThreadNamePrefix("Async-Executor-"); // 쓰레드에 사용 할
        taskExecutor.setDaemon(true);
        taskExecutor.initialize();

        return taskExecutor;
    }
}
