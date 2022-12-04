package com.example.webservice.service;

import com.example.webservice.dto.UserDto;

import java.util.List;

public interface UserService {
    List<UserDto> getAll();
    UserDto getOneById(long id);

    void deleteById(long id);

    UserDto save(UserDto user);
}
