package com.flo.handlerservice.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "posts")
public class Post extends BaseEntity<String> {
    @Id
    @GeneratedValue
    private Long id;

    private String description;

    private String userSso;

    public Post() {

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getUserSso() {
        return userSso;
    }

    public void setUserSso(String userSso) {
        this.userSso = userSso;
    }
}
