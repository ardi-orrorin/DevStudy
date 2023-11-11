package com.example.cloudhamony.service;

import com.example.cloudhamony.model.Diary;
import com.example.cloudhamony.repository.DiaryRepository;
import io.github.resilience4j.bulkhead.annotation.Bulkhead;
import io.github.resilience4j.circuitbreaker.annotation.CircuitBreaker;
import io.github.resilience4j.ratelimiter.annotation.RateLimiter;
import io.github.resilience4j.retry.annotation.Retry;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Random;
import java.util.concurrent.TimeoutException;

@Service
@RequiredArgsConstructor
@Slf4j
public class DiaryService {
    private final DiaryRepository diaryRepository;

    private void randomException() throws TimeoutException {
        Random rand = new Random();
        int randomNum = rand.nextInt(3) + 1;
        if(randomNum == 3) randomSleep();
    }

    private void randomSleep() throws TimeoutException {
        try {
            Thread.sleep((long) (Math.random() * 3000));
            throw new TimeoutException("TimeoutException");
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    // 간단한 에러 처리
//    public List<Diary> findAll() {
//        try {
//            randomException();
//            return diaryRepository.findAll();
//        } catch (TimeoutException e) {
//            return findAllFallback(e);
//        }
//    }


    // 회로 차단기 설정
    // name : 회로 차단기 이름
    // fallbackMethod : 회로 차단시 사용될 메소드
//    @CircuitBreaker(name = "diaryAll")
    @CircuitBreaker(name = "diaryAll", fallbackMethod = "findAllFallback")
    @Bulkhead(name = "bulkedDiaryAll", type = Bulkhead.Type.THREADPOOL, fallbackMethod = "findAllFallback")
    @Retry(name = "retryDiaryAll", fallbackMethod = "findAllFallback")
    @RateLimiter(name = "rateLimiterDiaryAll", fallbackMethod = "findAllFallback")
    public List<Diary> findAll() {
        try {
            randomException();
        } catch (TimeoutException e) {
            throw new RuntimeException("RuntimeException"); // 에러 발생시키기
        }

        return diaryRepository.findAll();
    }


    // 회로 차단시 사용될 메소드
    public List<Diary> findAllFallback(Exception e) {
        return List.of(new Diary(0L, "fallback", "fallback", null, null, null));
    }
}
