package com.flo.apigateway;


import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ApiGatewayConfiguration {
    @Bean
    public RouteLocator gatewayRouter(RouteLocatorBuilder builder) {
        return builder.routes()
                .route(r-> r.path("/fsa/**")
                        .filters(f -> f.rewritePath(
                                "/administration-service/(?<path>.*)",
                                "/$\\{path}"))
                        .uri("lb://administration-service"))
                .route(r-> r.path("/handler/**")
                        .filters(f -> f.rewritePath(
                                "/handler-service/(?<path>.*)",
                                "/$\\{path}"))
                        .uri("lb://handler-service"))
                .build();
    }
}