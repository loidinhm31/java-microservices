package com.flo.handlerservice.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "posts")
public class Post extends BaseEntity<String> {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "post_id")
    private Long postId;

    @Column(name = "description")
    private String description;

    @Column(name = "sso")
    private String sso;

    public Post() {

    }

    public Long getPostId() {
        return postId;
    }

    public void setPostId(Long id) {
        this.postId = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSso() {
        return sso;
    }

    public void setSso(String userSso) {
        this.sso = userSso;
    }
}
