package com.flo.notificationservice.service.impl;

import com.flo.notificationservice.document.Notification;
import com.flo.notificationservice.repository.NotificationRepository;
import com.flo.notificationservice.service.HistoryService;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HistoryServiceImpl implements HistoryService {
    private final NotificationRepository notificationRepository;

    private final MongoTemplate mongoTemplate;

    public HistoryServiceImpl(NotificationRepository notificationRepository, MongoTemplate mongoTemplate) {
        this.notificationRepository = notificationRepository;
        this.mongoTemplate = mongoTemplate;
    }


    @Override
    public List<Notification> findBySso(String sso) {
        Query query = new Query();
        query.addCriteria(Criteria.where("sso")
                .is(sso));

        List<Notification> notifications = mongoTemplate.find(query, Notification.class);

        return notifications;
    }

    @Override
    public void save(Notification notification) {
        notificationRepository.save(notification);
    }
}
