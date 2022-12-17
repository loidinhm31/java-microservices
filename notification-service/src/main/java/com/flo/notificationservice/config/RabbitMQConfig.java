package com.flo.notificationservice.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.amqp.support.converter.Jackson2JsonMessageConverter;
import org.springframework.amqp.support.converter.MessageConverter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class RabbitMQConfig {

    private final ObjectMapper objectMapper;

    public RabbitMQConfig(ObjectMapper objectMapper) {
        this.objectMapper = objectMapper;
    }

    @Bean
    public MessageConverter jacksonConverter() {
        objectMapper.findAndRegisterModules();
        MessageConverter jackson2JsonMessageConverter =
                new Jackson2JsonMessageConverter(objectMapper);
        return jackson2JsonMessageConverter;
    }

}