package com.example.mybatis.service

import org.springframework.security.core.userdetails.UserDetailsService
import org.springframework.stereotype.Service


@Service
interface UserService: UserDetailsService {
}