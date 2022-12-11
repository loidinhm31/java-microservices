package com.flo.handlerservice.service;

import com.flo.handlerservice.model.PostRequest;

import java.util.List;

public interface PostService {
    List<PostRequest> getAllByUserId(long userId);

    PostRequest save(long userId, PostRequest postRequest);
}
