package com.example.mybatis.config

import org.apache.ibatis.annotations.Mapper
import org.mybatis.spring.annotation.MapperScan
import org.springframework.context.annotation.Configuration


@Configuration
@MapperScan(basePackages = ["com.example.mybatis.dao"], annotationClass = Mapper::class)
class mybatisConfig {
}