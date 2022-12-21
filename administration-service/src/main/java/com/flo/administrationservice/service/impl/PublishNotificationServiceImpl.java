package com.flo.administrationservice.service.impl;


import com.flo.administrationservice.model.NotificationRequest;
import com.flo.administrationservice.producer.RabbitMQMessageProducer;
import com.flo.administrationservice.service.PublishNotificationService;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
public class PublishNotificationServiceImpl implements PublishNotificationService {
    private final RabbitMQMessageProducer rabbitMQMessageProducer;

    public PublishNotificationServiceImpl(RabbitMQMessageProducer rabbitMQMessageProducer) {
        this.rabbitMQMessageProducer = rabbitMQMessageProducer;
    }

    @Override
    public void sendNotification(String authorSso, String from, String to, String subject, String message) {
        NotificationRequest notificationRequest = new NotificationRequest(
                authorSso,
                from,
                to,
                subject,
                message,
                LocalDateTime.now()
        );

        rabbitMQMessageProducer.publish(
                notificationRequest,
                "internal.exchange",
                "internal.notification.routing-key"
        );
    }
}
