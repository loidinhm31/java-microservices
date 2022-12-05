package com.flo.webservice.controller;

import com.flo.webservice.dto.PostDto;
import com.flo.webservice.dto.UserDto;
import com.flo.webservice.service.PostService;
import com.flo.webservice.service.UserService;
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

    @GetMapping("/{id}")
    public ResponseEntity<UserDto> retrieveUser(@PathVariable long id) {
        UserDto userDto = userService.getOneById(id);
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
    public ResponseEntity<List<PostDto>> retrievePostsForUser(@PathVariable long id) {
        List<PostDto> postDtoList = postService.getAllByUserId(id);
        return ResponseEntity.ok(postDtoList);
    }

    @PostMapping("/{id}/posts")
    public ResponseEntity<PostDto> createPostForUser(@PathVariable long id, @RequestBody PostDto postDto) {
        PostDto result = postService.save(id, postDto);
        return ResponseEntity.ok(result);
    }
}
