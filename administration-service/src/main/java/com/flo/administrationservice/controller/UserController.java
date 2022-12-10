package com.flo.administrationservice.controller;

import com.flo.administrationservice.dto.UserDto;
import com.flo.administrationservice.record.UserResponse;
import com.flo.administrationservice.service.UserService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
}
