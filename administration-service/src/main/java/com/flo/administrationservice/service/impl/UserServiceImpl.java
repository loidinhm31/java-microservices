package com.flo.administrationservice.service.impl;

import com.flo.administrationservice.dto.RoleDto;
import com.flo.administrationservice.dto.UserDto;
import com.flo.administrationservice.dto.UserRoleDto;
import com.flo.administrationservice.entity.User;
import com.flo.administrationservice.exception.ObjectNotFoundException;
import com.flo.administrationservice.model.SSOGenericRead;
import com.flo.administrationservice.model.UserRequest;
import com.flo.administrationservice.record.UserResponse;
import com.flo.administrationservice.repository.UserRepository;
import com.flo.administrationservice.service.PublishNotificationService;
import com.flo.administrationservice.service.UserOIDCService;
import com.flo.administrationservice.service.UserService;
import com.flo.administrationservice.utilities.SecurityUtils;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Transactional(rollbackOn = Exception.class)
@Service
public class UserServiceImpl implements UserService {
    private final UserRepository userRepository;

    private final UserOIDCService userOIDCService;

    private final PublishNotificationService publishNotificationService;

    public UserServiceImpl(UserRepository userRepository, UserOIDCService userOIDCService, PublishNotificationService publishNotificationService) {
        this.userRepository = userRepository;
        this.userOIDCService = userOIDCService;
        this.publishNotificationService = publishNotificationService;
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

    @Override
    public UserDto createUser(UserRequest userRequest) {
        String authorSso = SecurityUtils.getSso();

        SSOGenericRead ssoGenericRead = userOIDCService.getUserInfoOIDC(userRequest.getSso());

        if (Objects.nonNull(ssoGenericRead)) {
            User user = new User();
            user.setSso(ssoGenericRead.getUsername());
            user.setUsername(ssoGenericRead.getLastName() + " " + ssoGenericRead.getFirstName());
            user.setEmail(ssoGenericRead.getEmail());
            user.setCreatedBy(authorSso);
            user.setUpdatedBy(authorSso);

            User createdUser = userRepository.save(user);

            // Send notification
            publishNotificationService.sendNotification(
                    authorSso,
                    "service@flo.com",
                    createdUser.getSso() + "@flo.com",
                    "<SYSTEM> Your account has been created",
                    String.format("You have the right to access the system, account was created by %s", authorSso)
            );

            UserDto userDto = new UserDto();
            userDto.setUserId(createdUser.getUserId());
            userDto.setSso(createdUser.getSso());
            userDto.setUsername(createdUser.getUsername());
            userDto.setEmail(createdUser.getEmail());
            return userDto;
        }
        return null;
    }
}
