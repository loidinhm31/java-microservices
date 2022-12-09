package com.flo.handlerservice.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "posts")
public class Post extends BaseEntity<String> {
    @Id
    @GeneratedValue
    private Long id;

    private String description;

    @ManyToOne(fetch = FetchType.LAZY)
    private User user;

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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
