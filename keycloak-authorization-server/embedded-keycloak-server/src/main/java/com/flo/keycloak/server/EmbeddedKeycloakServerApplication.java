package com.flo.keycloak.server;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.liquibase.LiquibaseAutoConfiguration;

@SpringBootApplication(exclude = LiquibaseAutoConfiguration.class)
public class EmbeddedKeycloakServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(EmbeddedKeycloakServerApplication.class, args);
    }

}
