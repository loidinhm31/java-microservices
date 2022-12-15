package com.flo.notificationservice.repository;

import com.flo.notificationservice.document.Notification;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.repository.NoRepositoryBean;

public interface NotificationRepository extends MongoRepository<Notification, String> {
}
