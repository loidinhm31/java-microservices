package com.example.webservice.service;

import com.example.webservice.dto.UserDto;
import com.example.webservice.models.User;

import java.util.List;

public interface UserService {
    List<UserDto> findAll();
    UserDto findOne(int id);

    void deleteById(int id);

    UserDto save(UserDto user);
}
