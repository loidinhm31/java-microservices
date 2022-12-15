package com.flo.notificationservice.document;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.time.LocalDateTime;

@Document
public class Notification {
    @Id
    private String id;

//    @Indexed(unique = true)
    private String sso;

    private String fromAddress;

    private String toAddress;

    private String subject;

    private LocalDateTime triggerAt;

    private LocalDateTime createdAt;

    public Notification() {

    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getSso() {
        return sso;
    }

    public void setSso(String sso) {
        this.sso = sso;
    }

    public String getFromAddress() {
        return fromAddress;
    }

    public void setFromAddress(String fromAddress) {
        this.fromAddress = fromAddress;
    }

    public String getToAddress() {
        return toAddress;
    }

    public void setToAddress(String toAddress) {
        this.toAddress = toAddress;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public LocalDateTime getTriggerAt() {
        return triggerAt;
    }

    public void setTriggerAt(LocalDateTime triggerAt) {
        this.triggerAt = triggerAt;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}
