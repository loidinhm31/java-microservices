package com.flo.handlerservice.service;

import com.flo.handlerservice.dto.PostDto;

import java.util.List;

public interface PostService {
    List<PostDto> getAllByUserId(long userId);

    PostDto save(long userId, PostDto postDto);
}
