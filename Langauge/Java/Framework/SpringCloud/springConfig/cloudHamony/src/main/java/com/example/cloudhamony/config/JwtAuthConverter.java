package com.example.cloudhamony.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.security.oauth2.resource.OAuth2ResourceServerProperties;

import org.springframework.core.convert.converter.Converter;
import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class JwtAuthConverter implements Converter<OAuth2ResourceServerProperties.Jwt, AbstractAuthenticationToken> {
    @Override
    public AbstractAuthenticationToken convert(OAuth2ResourceServerProperties.Jwt source) {
        return null;
    }

    @Override
    public <U> Converter<OAuth2ResourceServerProperties.Jwt, U> andThen(Converter<? super AbstractAuthenticationToken, ? extends U> after) {
        return Converter.super.andThen(after);
    }
}
