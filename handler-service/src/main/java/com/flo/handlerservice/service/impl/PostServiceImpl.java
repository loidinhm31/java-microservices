package com.flo.handlerservice.service.impl;

import com.flo.handlerservice.entity.Post;
import com.flo.handlerservice.model.PostRequest;
import com.flo.handlerservice.repository.PostRepository;
import com.flo.handlerservice.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PostServiceImpl implements PostService {
    private final PostRepository postRepository;

    @Autowired
    public PostServiceImpl(PostRepository postRepository) {
        this.postRepository = postRepository;
    }


    @Override
    public List<PostRequest> getAllByUserId(long userId) {
        List<Post> posts = postRepository.findAllByUserId(userId);

        List<PostRequest> postRequestList = posts.stream().map(post -> {
            PostRequest postRequest = new PostRequest();
            postRequest.setId(post.getId());
            postRequest.setDescription(post.getDescription());
            return postRequest;
        }).toList();
        return postRequestList;
    }

    @Override
    public PostRequest save(long userId, PostRequest postRequest) {
//        Optional<User> user = userRepository.findById(userId);
//        if (user.isEmpty())
//            throw new ObjectNotFoundException(String.format("cannot find user id: %s", userId));

        Post post = new Post();
        post.setDescription(postRequest.getDescription());
//        post.setUserSso(null);
        post.setCreatedBy(String.valueOf(userId));
        post.setUpdatedBy(String.valueOf(userId));

        Post savedPost = postRepository.save(post);
        PostRequest resultPost = new PostRequest();
        resultPost.setId(savedPost.getId());
        resultPost.setDescription(savedPost.getDescription());
//        resultPost.setUserId(savedPost.getUser().getId());
        return resultPost;
    }
}
