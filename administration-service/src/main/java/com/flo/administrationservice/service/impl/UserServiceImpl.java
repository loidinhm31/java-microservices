package com.flo.administrationservice.service.impl;

import com.flo.administrationservice.dto.RoleDto;
import com.flo.administrationservice.dto.UserDto;
import com.flo.administrationservice.dto.UserRoleDto;
import com.flo.administrationservice.entity.User;
import com.flo.administrationservice.exception.ObjectNotFoundException;
import com.flo.administrationservice.record.UserResponse;
import com.flo.administrationservice.repository.UserRepository;
import com.flo.administrationservice.service.UserService;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Service
public class UserServiceImpl implements UserService {
    private final UserRepository userRepository;

    public UserServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }


    @Override
    public UserResponse findByUserSso(String sso) {
        User user = userRepository.findBySsoIgnoreCase(sso);

        if (Objects.isNull(user))
            throw new ObjectNotFoundException(String.format("cannot find user with SSO: %s\n", sso));

        UserResponse userResponse = new UserResponse(
                user.getSso(),
                user.getUsername()
        );
        return userResponse;
    }

    @Override
    public UserDto findRolesByUserSso(String sso) {
        User user = userRepository.findBySsoIgnoreCase(sso);

        if (Objects.isNull(user))
            throw new ObjectNotFoundException(String.format("cannot find user with SSO: %s\n", sso));

        UserDto userDto = new UserDto();
        userDto.setSso(user.getSso());
        userDto.setUsername(user.getUsername());
        userDto.setEmail(user.getEmail());

        List<UserRoleDto> userRoleDtos = new ArrayList<>();
        user.getUserRoles().forEach(
                ur -> {
                    UserRoleDto userRoleDto = new UserRoleDto();
                    userRoleDto.setActive(ur.getActive());

                    RoleDto roleDto = new RoleDto();
                    roleDto.setRoleId(ur.getRole().getRoleId());
                    roleDto.setRoleCode(ur.getRole().getRoleCode());
                    roleDto.setRoleName(ur.getRole().getRoleName());
                    userRoleDto.setRole(roleDto);

                    userRoleDtos.add(userRoleDto);
                }
        );
        userDto.setUserRoles(userRoleDtos);
        return userDto;
    }
}
