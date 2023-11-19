package com.example.mybatis.config

import com.example.mybatis.service.UserService
import org.springframework.context.annotation.Bean
import org.springframework.security.authentication.AuthenticationManager
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder
import org.springframework.security.config.annotation.web.builders.HttpSecurity
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer
import org.springframework.security.crypto.password.PasswordEncoder
import org.springframework.security.web.SecurityFilterChain
import org.springframework.web.cors.CorsConfiguration


@EnableWebSecurity
class SecurityConfig(
    private val userService: UserService,
    private val passwordEncoder: PasswordEncoder,
) {

    @Bean
    fun configure(): WebSecurityCustomizer {
        return WebSecurityCustomizer {
            it.ignoring().requestMatchers("/css/**", "/js/**", "/img/**", "/lib/**")
        }
    }

    @Bean
    fun securityFilterChain(http: HttpSecurity): SecurityFilterChain {
        return http.authorizeHttpRequests{
            it.requestMatchers("/member/**").permitAll()
            it.anyRequest().authenticated()
        }
        .cors {
            it.configurationSource {
                val config = CorsConfiguration()
                config.addAllowedOrigin("*")
                config.addAllowedHeader("*")
                config.addAllowedMethod("*")
                config
            }
        }.build()
    }

    @Bean
    fun authentication(http: HttpSecurity): AuthenticationManager {

        return http.getSharedObject(AuthenticationManagerBuilder::class.java)
            .userDetailsService(userService)
            .passwordEncoder(passwordEncoder)
            .and().build()

    }


}