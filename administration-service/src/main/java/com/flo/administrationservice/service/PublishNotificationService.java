package com.flo.administrationservice.service;

public interface PublishNotificationService {
    void sendNotification(String authorSso, String from, String to, String subject, String message);
}
