package com.example.webservice.controller;

import com.example.webservice.dto.UserDto;
import com.example.webservice.models.User;
import com.example.webservice.service.UserService;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/v1/users")
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping
    public List<UserDto> retrieveAllUsers() {
        return userService.findAll();
    }

    @GetMapping("/{id}")
    public UserDto retrieveUser(@PathVariable int id) {
        UserDto userDto = userService.findOne(id);

        return userDto;
    }

    @PostMapping
    public ResponseEntity<UserDto> createUser(@Valid @RequestBody UserDto userDto) {
        UserDto savedUser = userService.save(userDto);

        return ResponseEntity.ok(savedUser);
    }

    @DeleteMapping("/{id}")
    public void deleteUser(@PathVariable int id) {
        userService.deleteById(id);
    }
}
