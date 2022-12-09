package com.flo.handlerservice.service;

import com.flo.handlerservice.dto.UserDto;

import java.util.List;

public interface UserService {
    List<UserDto> getAll();
    UserDto getOneById(long id);

    void deleteById(long id);

    UserDto save(UserDto user);
}
