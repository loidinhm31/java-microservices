package com.flo.handlerservice.model;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class PostRequest {
    private long postId;

    private String description;

    private String userSso;

    public PostRequest() {

    }

    public long getPostId() {
        return postId;
    }

    public void setPostId(Long postId) {
        this.postId = postId;
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
