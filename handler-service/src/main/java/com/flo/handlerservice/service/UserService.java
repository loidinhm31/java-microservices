package com.flo.handlerservice.service;

import com.flo.handlerservice.dto.UserDto;
import com.flo.handlerservice.record.UserResponse;

import java.util.List;

public interface UserService {
    List<UserDto> getAll();
    UserResponse getOneBySso(String userSso);

    void deleteById(long id);

    UserDto save(UserDto user);
}
