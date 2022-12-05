package com.flo.webservice.service.impl;

import com.flo.webservice.dto.PostDto;
import com.flo.webservice.entity.Post;
import com.flo.webservice.entity.User;
import com.flo.webservice.exception.ObjectNotFoundException;
import com.flo.webservice.repository.PostRepository;
import com.flo.webservice.repository.UserRepository;
import com.flo.webservice.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PostServiceImpl implements PostService {
    private final UserRepository userRepository;
    private final PostRepository postRepository;

    @Autowired
    public PostServiceImpl(UserRepository userRepository, PostRepository postRepository) {
        this.userRepository = userRepository;
        this.postRepository = postRepository;
    }


    @Override
    public List<PostDto> getAllByUserId(long userId) {
        List<Post> posts = postRepository.findAllByUserId(userId);

        List<PostDto> postDtoList = posts.stream().map(post -> {
            PostDto postDto = new PostDto();
            postDto.setId(post.getId());
            postDto.setDescription(post.getDescription());
            return postDto;
        }).toList();
        return postDtoList;
    }

    @Override
    public PostDto save(long userId, PostDto postDto) {
        Optional<User> user = userRepository.findById(userId);
        if (user.isEmpty())
            throw new ObjectNotFoundException(String.format("cannot find user id: %s", userId));

        Post post = new Post();
        post.setDescription(postDto.getDescription());
        post.setUser(user.get());
        post.setCreatedBy(String.valueOf(userId));
        post.setUpdatedBy(String.valueOf(userId));

        Post savedPost = postRepository.save(post);
        PostDto resultPost = new PostDto();
        resultPost.setId(savedPost.getId());
        resultPost.setDescription(savedPost.getDescription());
        resultPost.setUserId(savedPost.getUser().getId());
        return resultPost;
    }
}
