package com.example.webservice.service;

import com.example.webservice.dto.PostDto;

import java.util.List;

public interface PostService {
    List<PostDto> getAllByUserId(long userId);

    PostDto save(long userId, PostDto postDto);
}
