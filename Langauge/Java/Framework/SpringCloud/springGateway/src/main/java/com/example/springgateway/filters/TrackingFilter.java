package com.example.springgateway.filters;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.gateway.filter.FilterDefinition;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

@Order(1)
@Component
@Slf4j
@RequiredArgsConstructor
public class TrackingFilter implements GlobalFilter {

    // 상관관계ID
    public static final String CORRELATION_ID = "tmx-correlation-id";
    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        log.info("TrackingFilter baseMessage: {}", exchange.getRequest().getPath());
        HttpHeaders headers = exchange.getRequest().getHeaders();
        headers.forEach((key, value) -> {
            log.info("{}: {}", key, value);
        });
        if (hasCorrelationId(headers)) {
            log.info("correlation-id found in tracking filter: {}. ", headers.get(CORRELATION_ID));
        } else {
            String correlationID = java.util.UUID.randomUUID().toString();
            log.info("correlation-id generated in tracking filter: {}.", correlationID);

            // tmx-correlation-id 헤더를 추가한다.
            exchange = exchange.mutate().request(
                    exchange.getRequest().mutate().header(CORRELATION_ID, correlationID).build()
            ).build();
        }


        return chain.filter(exchange);
    }

    private boolean hasCorrelationId(HttpHeaders headers) {

        return headers.containsKey(CORRELATION_ID);
    }
}
