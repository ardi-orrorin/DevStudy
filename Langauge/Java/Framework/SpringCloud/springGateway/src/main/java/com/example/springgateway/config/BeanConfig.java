package com.example.springgateway.config;


import com.example.springgateway.filters.FilterUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpHeaders;
import reactor.core.publisher.Mono;

@Configuration
@Slf4j
@RequiredArgsConstructor
public class BeanConfig {

    private final FilterUtils filterUtils;

    @Bean
    public GlobalFilter postGlobalFilter() {
        return (exchange, chain) -> {
            log.info("postGlobalFilter baseMessage: {}", exchange.getRequest().getPath());
            return chain.filter(exchange).then(Mono.fromRunnable(() -> {
                HttpHeaders requestHeaders = exchange.getRequest().getHeaders();
                String correlationID = requestHeaders.get(filterUtils.CORRELATION_ID).stream().findFirst().get();
                log.info("tmx-correlation-id: {}", correlationID);

                log.info("adding the correlation id to the outbound headers. {}", correlationID);
                exchange.getResponse().getHeaders().add(filterUtils.CORRELATION_ID, correlationID);

                log.info("postGlobalFilter end : {}", exchange.getRequest().getURI());
            }));
        };
    }
}
