package com.flo.handlerservice.service.impl;

import com.flo.handlerservice.model.NotificationRequest;
import com.flo.handlerservice.producer.RabbitMQMessageProducer;
import com.flo.handlerservice.service.PublishNotificationService;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
public class PublishNotificationServiceImpl implements PublishNotificationService {
    private final RabbitMQMessageProducer rabbitMQMessageProducer;

    public PublishNotificationServiceImpl(RabbitMQMessageProducer rabbitMQMessageProducer) {
        this.rabbitMQMessageProducer = rabbitMQMessageProducer;
    }

    public void sendNotification() {
        String userSso = SecurityContextHolder.getContext().getAuthentication().getName();

        NotificationRequest notificationRequest = new NotificationRequest(
                userSso,
                userSso + "@example.com",
                "test_mail@example.com",
                "Test notification",
                LocalDateTime.now()
        );

        rabbitMQMessageProducer.publish(
                notificationRequest,
                "internal.exchange",
                "internal.notification.routing-key"
        );
    }
}
