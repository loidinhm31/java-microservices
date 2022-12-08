package com.flo.keycloak.starter;


import com.flo.keycloak.EmbeddedKeycloakConfig;
import com.flo.keycloak.KeycloakCustomProperties;
import com.flo.keycloak.KeycloakProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@EnableConfigurationProperties({KeycloakProperties.class, KeycloakCustomProperties.class})
@ComponentScan(basePackageClasses = EmbeddedKeycloakConfig.class)
public class EmbeddedSpringKeycloakAutoConfiguration {
}
