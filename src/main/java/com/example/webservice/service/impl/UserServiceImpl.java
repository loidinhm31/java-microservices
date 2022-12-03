package com.example.webservice.service.impl;

import com.example.webservice.dto.UserDto;
import com.example.webservice.models.User;
import com.example.webservice.service.UserService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Override
    public List<UserDto> findAll() {
        return null;
    }

    @Override
    public UserDto findOne(int id) {
        return null;
    }

    @Override
    public void deleteById(int id) {

    }

    @Override
    public UserDto save(UserDto user) {
        return null;
    }
}
