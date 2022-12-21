package com.flo.handlerservice.controller;

import io.github.resilience4j.bulkhead.annotation.Bulkhead;
import io.github.resilience4j.circuitbreaker.annotation.CircuitBreaker;
import io.github.resilience4j.ratelimiter.annotation.RateLimiter;
import io.github.resilience4j.retry.annotation.Retry;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
@RequestMapping("/v1/resilience")
public class ResilienceController {
    private final Logger log = LoggerFactory.getLogger(this.getClass());

    /**
     * The retry pattern provides resiliency to a system by recovering from transient issues.
     * @return
     */
    @GetMapping("/retry-api")
    @Retry(name = "retryApi", fallbackMethod = "fallbackAfterRetry")
    public String retryApi() {
        log.info("Retry API call received");
        ResponseEntity<String> entity =
                new RestTemplate().getForEntity("http://localhost:9090/dummy-api", String.class);
        return entity.getBody();
    }

    public String fallbackAfterRetry(Exception ex) {
        return "all retries have exhausted";
    }

    /**
     * The circuit breaker pattern protects a downstream service by restricting the upstream service from calling the downstream service during a partial or complete downtime.
     * @return
     */
    @GetMapping("/circuit-breaker-api")
    @CircuitBreaker(name = "circuitBreakerApi")
    public String circuitBreakerApi() {
        log.info("Circuit Breaker API call received");
        ResponseEntity<String> entity =
                new RestTemplate().getForEntity("http://localhost:9090/dummy-api", String.class);
        return entity.getBody();
    }

    /**
     * The bulkhead pattern limits the maximum number of concurrent calls to an external service.
     * @return
     */
    @GetMapping("/bulkhead-api")
    @Bulkhead(name = "bulkheadApi")
    public String bulkheadApi() {
        log.info("Bulk Head API call received");
        ResponseEntity<String> entity =
                new RestTemplate().getForEntity("http://localhost:9090/dummy-api", String.class);
        return entity.getBody();
    }

    /**
     * The rate limiter pattern limits the rate of requests to a resource.
     * @return
     */
    @GetMapping("/rate-limiter-api")
    @RateLimiter(name = "rateLimiterApi")
    public String rateLimitApi() {
        log.info("Rate Limiter API call received");
        return "reached rate limiter api";
    }
}
