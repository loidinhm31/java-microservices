package com.flo.webservice.service;

import com.flo.webservice.dto.UserDto;

import java.util.List;

public interface UserService {
    List<UserDto> getAll();
    UserDto getOneById(long id);

    void deleteById(long id);

    UserDto save(UserDto user);
}
