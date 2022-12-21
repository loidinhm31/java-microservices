package com.flo.notificationservice.service;

import com.flo.notificationservice.document.Notification;

import java.util.List;

public interface HistoryService {
    List<Notification> findBySso(String sso);
    void save(Notification notification);
}
