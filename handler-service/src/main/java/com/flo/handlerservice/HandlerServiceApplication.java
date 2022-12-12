package com.flo.handlerservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing
@EnableDiscoveryClient
@EnableFeignClients(basePackages = "com.flo.handlerservice.feign")
public class HandlerServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(HandlerServiceApplication.class, args);
    }

}
