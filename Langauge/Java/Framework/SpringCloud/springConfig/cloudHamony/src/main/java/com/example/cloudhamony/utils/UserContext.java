package com.example.cloudhamony.utils;

import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
@Getter
@Setter
public class UserContext {

    @Value("${userContext.correlationId}")
    public static final String CORRELATION_ID = "";

    @Value("${userContext.authToken}")
    public static final String AUTH_TOKEN = "";

    @Value("${userContext.userId}")
    public static final String USER_ID = "";
    @Value("${userContext.organizationId}")
    public static final String ORGANIZATION_ID = "";

    private String correlationId = new String();
    private String authToken = new String();
    private String userId = new String();
    private String organizationId = new String();

}
