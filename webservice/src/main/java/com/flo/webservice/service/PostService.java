package com.flo.webservice.service;

import com.flo.webservice.dto.PostDto;

import java.util.List;

public interface PostService {
    List<PostDto> getAllByUserId(long userId);

    PostDto save(long userId, PostDto postDto);
}
