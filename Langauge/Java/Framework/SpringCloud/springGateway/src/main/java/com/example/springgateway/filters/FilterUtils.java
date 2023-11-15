package com.example.springgateway.filters;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class FilterUtils {

    @Value("${userContext.correlationId}")
    public String CORRELATION_ID;

    @Value("${userContext.authToken}")
    public String AUTH_TOKEN;

    @Value("${userContext.userId}")
    public String USER_ID;
    @Value("${userContext.organizationId}")
    public String ORGANIZATION_ID;
}
