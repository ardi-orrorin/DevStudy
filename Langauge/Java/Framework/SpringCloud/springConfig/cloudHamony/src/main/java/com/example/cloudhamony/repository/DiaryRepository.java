package com.example.cloudhamony.repository;

import com.example.cloudhamony.model.Diary;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DiaryRepository extends JpaRepository<Diary, Long> {
}
