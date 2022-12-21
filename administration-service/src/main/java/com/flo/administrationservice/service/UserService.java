package com.flo.administrationservice.service;

import com.flo.administrationservice.dto.UserDto;
import com.flo.administrationservice.model.UserRequest;
import com.flo.administrationservice.record.UserResponse;

public interface UserService {
    UserResponse findByUserSso(String sso);

    UserDto findRolesByUserSso(String sso);

    UserDto createUser(UserRequest userRequest);
}
