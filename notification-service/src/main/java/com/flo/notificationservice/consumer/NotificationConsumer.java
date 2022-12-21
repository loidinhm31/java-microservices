package com.flo.notificationservice.consumer;

import com.flo.notificationservice.document.Notification;
import com.flo.notificationservice.model.NotificationRequest;
import com.flo.notificationservice.service.HistoryService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Component
public class NotificationConsumer {
    private final Logger log = LoggerFactory.getLogger(this.getClass());

    private final HistoryService historyService;

    public NotificationConsumer(HistoryService historyService) {
        this.historyService = historyService;
    }

    @RabbitListener(queues = "${rabbitmq.queues.notification}")
    public void consumer(NotificationRequest notificationRequest) {
        log.info("Consumed payload from queue from sso {}", notificationRequest.getSso());

        Notification notification = new Notification();
        notification.setSso(notificationRequest.getSso());
        notification.setSubject(notificationRequest.getSubject());
        notification.setFromAddress(notificationRequest.getFromAddress());
        notification.setToAddress(notificationRequest.getToAddress());
        notification.setTriggerAt(notificationRequest.getTriggerAt());
        notification.setCreatedAt(LocalDateTime.now());

        historyService.save(notification);
    }
}
