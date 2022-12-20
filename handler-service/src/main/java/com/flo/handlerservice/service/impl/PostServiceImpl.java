package com.flo.handlerservice.service.impl;

import com.flo.handlerservice.dto.PostDto;
import com.flo.handlerservice.dto.UserDto;
import com.flo.handlerservice.entity.Post;
import com.flo.handlerservice.exception.ObjectNotFoundException;
import com.flo.handlerservice.feign.client.AdministrationClient;
import com.flo.handlerservice.model.PostRequest;
import com.flo.handlerservice.record.UserResponse;
import com.flo.handlerservice.repository.PostRepository;
import com.flo.handlerservice.service.PostService;
import com.flo.handlerservice.utilities.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

@Service
public class PostServiceImpl implements PostService {

    private final Logger log = LoggerFactory.getLogger(this.getClass());

    private final AdministrationClient administrationClient;

    private final PostRepository postRepository;

    @Autowired
    public PostServiceImpl(AdministrationClient administrationClient, PostRepository postRepository) {
        this.administrationClient = administrationClient;
        this.postRepository = postRepository;
    }


    @Override
    public List<PostRequest> getAllByUserSso(String userSso) {
        // Check user
        ResponseEntity<UserResponse> responseEntity = administrationClient.getUserInfo(userSso);
        UserResponse userResponse = responseEntity.getBody();
        if (responseEntity.getStatusCode().is2xxSuccessful() &&
                Objects.nonNull(userResponse)) {
            List<Post> posts = postRepository.findAllBySso(userSso);

            List<PostRequest> postRequestList = posts.stream().map(post -> {
                PostRequest postRequest = new PostRequest();
                postRequest.setPostId(post.getPostId());
                postRequest.setDescription(post.getDescription());
                return postRequest;
            }).toList();
            return postRequestList;
        } else {
            log.info("Cannot found user from admin client");
            throw new ObjectNotFoundException(String.format("user not found exception for %s", userSso));
        }
    }

    @Override
    public PostDto save(PostRequest postRequest) {
        // Check user
        ResponseEntity<UserResponse> responseEntity = administrationClient.getUserInfo(postRequest.getUserSso());
        UserResponse userResponse = responseEntity.getBody();
        if (responseEntity.getStatusCode().is2xxSuccessful() &&
                Objects.nonNull(userResponse)) {

            String authorSso = SecurityUtils.getSso();

            Post post = new Post();
            post.setDescription(postRequest.getDescription());
            post.setSso(postRequest.getUserSso());
            post.setCreatedBy(authorSso);
            post.setUpdatedBy(authorSso);

            // Save post
            Post savedPost = postRepository.save(post);
            PostDto resultPost = new PostDto();
            resultPost.setPostId(savedPost.getPostId());
            resultPost.setDescription(savedPost.getDescription());

            UserDto userDto = new UserDto();
            userDto.setSso(userDto.getSso());
            userDto.setUsername(userResponse.username());
            userDto.setEmail(userResponse.email());
            resultPost.setUserDto(userDto);

            return resultPost;
        } else
            throw new ObjectNotFoundException(String.format("user not found exception for %s", postRequest.getUserSso()));
    }
}
