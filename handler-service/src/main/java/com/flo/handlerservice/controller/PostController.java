package com.flo.handlerservice.controller;

import com.flo.handlerservice.dto.PostDto;
import com.flo.handlerservice.model.PostRequest;
import com.flo.handlerservice.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/v1/posts")
public class PostController {

    private final PostService postService;

    @Autowired
    public PostController(PostService postService) {
        this.postService = postService;
    }

    @GetMapping
    public ResponseEntity<List<PostRequest>> retrievePostsBySso(@RequestParam(name = "sso") String userSso) {
        List<PostRequest> postRequestList = postService.getAllByUserSso(userSso);
        return ResponseEntity.ok(postRequestList);
    }

    @PostMapping
    public ResponseEntity<PostDto> createPostForUser(@RequestBody PostRequest postRequest) {
        PostDto result = postService.save(postRequest);
        return ResponseEntity.ok(result);
    }
}
