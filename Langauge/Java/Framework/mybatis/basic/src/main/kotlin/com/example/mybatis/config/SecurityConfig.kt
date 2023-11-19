package com.example.mybatis.config

import com.example.mybatis.service.UserService
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.security.authentication.AuthenticationManager
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder
import org.springframework.security.config.annotation.web.builders.HttpSecurity
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer
import org.springframework.security.crypto.password.PasswordEncoder
import org.springframework.security.web.SecurityFilterChain
import org.springframework.security.web.csrf.CookieCsrfTokenRepository
import org.springframework.web.cors.CorsConfiguration


@Configuration
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
    fun securityFilterChain(http: HttpSecurity) : SecurityFilterChain {
        return http
        .headers {
            it.frameOptions { it.disable() }
        }
        .csrf {
//            it.disable()
            it.csrfTokenRepository(CookieCsrfTokenRepository.withHttpOnlyFalse())
        }
        .cors {
            it.configurationSource {
                val config = CorsConfiguration()
                config.addAllowedOrigin("*")
                config.addAllowedHeader("*")
                config.addAllowedMethod("*")
                config
            }
        }
        .authorizeHttpRequests{
    //            it.requestMatchers("/member/**").permitAll()
            it.anyRequest().permitAll()
        }
        .httpBasic {
            it.disable()
        }
        .formLogin {
            it.disable()
        }
        .build()
    }

    @Bean
    fun authentication(http: HttpSecurity): AuthenticationManager {

        return http.getSharedObject(AuthenticationManagerBuilder::class.java)
            .userDetailsService(userService)
            .passwordEncoder(passwordEncoder)
            .and().build()

    }


}