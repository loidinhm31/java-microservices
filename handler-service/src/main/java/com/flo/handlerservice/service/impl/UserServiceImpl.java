package com.flo.handlerservice.service.impl;

import com.flo.handlerservice.dto.UserDto;
import com.flo.handlerservice.exception.ObjectNotFoundException;
import com.flo.handlerservice.feign.client.AdministrationClient;
import com.flo.handlerservice.record.UserResponse;
import com.flo.handlerservice.service.UserService;
import feign.FeignException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    private final Logger LOG = LoggerFactory.getLogger(UserServiceImpl.class);

    private final AdministrationClient administrationClient;

    public UserServiceImpl(AdministrationClient administrationClient) {
        this.administrationClient = administrationClient;
    }

    @Override
    public List<UserDto> getAll() {
        return null;
    }

    @Override
    public UserResponse getOneBySso(String userSso) {
        try {
            ResponseEntity<UserResponse> userResponseResponseEntity = administrationClient.getUserInfo(userSso);
            return userResponseResponseEntity.getBody();

        } catch (FeignException.FeignClientException e) {
            LOG.error("User error: ", e);
            throw new ObjectNotFoundException(String.format("cannot not find user with sso: %s", userSso));
        }
    }

    @Override
    public void deleteById(long id) {
    }

    @Override
    public UserDto save(UserDto user) {
        return null;
    }
}
