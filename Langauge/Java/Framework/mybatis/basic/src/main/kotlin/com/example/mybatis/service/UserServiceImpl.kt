package com.example.mybatis.service

import com.example.mybatis.dao.MemberMapper
import com.example.mybatis.dto.MemberDTO
import com.example.mybatis.dto.UserImpl
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.stereotype.Service

@Service
class UserServiceImpl(
    val memberMapper: MemberMapper
): UserService {
    override fun loadUserByUsername(username: String?): UserDetails {
        if(username == null) throw Exception("계정이 없습니다. 회원가입을 해주세요")
        val member = memberMapper.selectByUserId(username)

        if(member == null) throw Exception("계정이 없습니다. 회원가입을 해주세요")
        val user: UserImpl = UserImpl().setUserDetails(member)

        return user
    }
}