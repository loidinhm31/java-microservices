package com.flo.handlerservice.service;

import com.flo.handlerservice.dto.PostDto;
import com.flo.handlerservice.model.PostRequest;

import java.util.List;

public interface PostService {
    List<PostRequest> getAllByUserSso(String userSso);

    PostDto save(PostRequest postRequest);
}
