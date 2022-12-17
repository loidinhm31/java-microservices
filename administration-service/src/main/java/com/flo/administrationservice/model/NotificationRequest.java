package com.flo.administrationservice.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.time.LocalDateTime;

public class NotificationRequest {
    private String sso;

    private String fromAddress;

    private String toAddress;

    private String subject;

    private String message;

    @JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss.SSS'ZZZZZ'")
    private LocalDateTime triggerAt;

    public NotificationRequest() {

    }

    public NotificationRequest(String sso, String fromAddress, String toAddress, String subject, String message, LocalDateTime triggerAt) {
        this.sso = sso;
        this.fromAddress = fromAddress;
        this.toAddress = toAddress;
        this.subject = subject;
        this.message = message;
        this.triggerAt = triggerAt;
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

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public LocalDateTime getTriggerAt() {
        return triggerAt;
    }

    public void setTriggerAt(LocalDateTime triggerAt) {
        this.triggerAt = triggerAt;
    }
}
