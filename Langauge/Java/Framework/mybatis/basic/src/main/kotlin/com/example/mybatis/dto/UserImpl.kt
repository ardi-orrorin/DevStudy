package com.example.mybatis.dto

import org.springframework.security.core.GrantedAuthority
import org.springframework.security.core.userdetails.User
import org.springframework.security.core.userdetails.UserDetails
import java.time.LocalDateTime

data class UserImpl(
    var id: Long? = null,
    var userId: String? = null,
    var createAt: LocalDateTime = LocalDateTime.now(),
    var updateAt: LocalDateTime? = null,
    var deleteAt: LocalDateTime? = null,
) : UserDetails {

    fun setUserDetails(member: MemberDTO): UserImpl {
        this.id = member.id
        this.userId = member.userId
        this.createAt = member.createAt
        this.updateAt = member.updateAt
        this.deleteAt = member.deleteAt
        return this
    }
    override fun getAuthorities(): MutableCollection<out GrantedAuthority> {
        TODO("Not yet implemented")
    }

    override fun getPassword(): String? {
        return null
    }

    override fun getUsername(): String {
        return this.userId!!
    }

    override fun isAccountNonExpired(): Boolean {
        TODO("Not yet implemented")
    }

    override fun isAccountNonLocked(): Boolean {
        TODO("Not yet implemented")
    }

    override fun isCredentialsNonExpired(): Boolean {
        TODO("Not yet implemented")
    }

    override fun isEnabled(): Boolean {
        TODO("Not yet implemented")
    }
}
