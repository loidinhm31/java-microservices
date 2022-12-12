package com.flo.handlerservice.controller;

import com.flo.handlerservice.dto.UserDto;
import com.flo.handlerservice.model.PostRequest;
import com.flo.handlerservice.record.UserResponse;
import com.flo.handlerservice.service.PostService;
import com.flo.handlerservice.service.UserService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/v1/users")
public class UserController {

    private final UserService userService;
    private final PostService postService;

    @Autowired
    public UserController(UserService userService, PostService postService) {
        this.userService = userService;
        this.postService = postService;
    }

    @GetMapping
    public ResponseEntity<List<UserDto>> retrieveAllUsers() {
        return ResponseEntity.ok(userService.getAll());
    }

    @GetMapping("/{sso}")
    public ResponseEntity<UserResponse> retrieveUser(@PathVariable String sso) {
        UserResponse userDto = userService.getOneBySso(sso);
        return ResponseEntity.ok(userDto);
    }

    @PostMapping
    public ResponseEntity<UserDto> createUser(@Valid @RequestBody UserDto userDto) {
        UserDto savedUser = userService.save(userDto);
        return ResponseEntity.ok(savedUser);
    }

    @DeleteMapping("/{id}")
    public void deleteUser(@PathVariable long id) {
        userService.deleteById(id);
    }

    @GetMapping("/{id}/posts")
    public ResponseEntity<List<PostRequest>> retrievePostsForUser(@PathVariable long id) {
        List<PostRequest> postRequestList = postService.getAllByUserId(id);
        return ResponseEntity.ok(postRequestList);
    }

    @PostMapping("/{id}/posts")
    public ResponseEntity<PostRequest> createPostForUser(@PathVariable long id, @RequestBody PostRequest postRequest) {
        PostRequest result = postService.save(id, postRequest);
        return ResponseEntity.ok(result);
    }
}
