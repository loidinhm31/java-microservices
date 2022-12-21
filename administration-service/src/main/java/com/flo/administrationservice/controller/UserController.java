package com.flo.administrationservice.controller;

import com.flo.administrationservice.dto.UserDto;
import com.flo.administrationservice.model.UserRequest;
import com.flo.administrationservice.record.UserResponse;
import com.flo.administrationservice.service.UserService;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/v1/users")
public class UserController {
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping(path = "{sso}")
    public ResponseEntity<UserResponse> getUserInfo(@PathVariable("sso") String userSso) {
        UserResponse userResponse = userService.findByUserSso(userSso);
        return ResponseEntity.ok(userResponse);
    }

    @GetMapping(path = "/{sso}/roles")
    ResponseEntity<UserDto> retrieveRolesForUser(@PathVariable("sso") String userSso) {
        UserDto userDto = userService.findRolesByUserSso(userSso);

        return ResponseEntity.ok(userDto);
    }

    @PostMapping
    public ResponseEntity<UserDto> createUser(@RequestBody @Valid UserRequest userRequest) {
        UserDto savedUser = userService.createUser(userRequest);
        return ResponseEntity.ok(savedUser);
    }}
