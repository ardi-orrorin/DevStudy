package com.example.cloudhamony.service;

import com.example.cloudhamony.model.Diary;
import com.example.cloudhamony.repository.DiaryRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class DiaryService {
    private final DiaryRepository diaryRepository;

    public List<Diary> findAll() {
        return diaryRepository.findAll();
    }

}
