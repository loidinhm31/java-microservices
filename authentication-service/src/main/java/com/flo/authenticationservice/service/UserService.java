package com.flo.authenticationservice.service;

import com.flo.authenticationservice.entity.User;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserService extends UserDetailsService {
    User findById(Long id);
    User findByUsername(String username);
}
