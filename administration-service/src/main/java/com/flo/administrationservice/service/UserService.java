package com.flo.administrationservice.service;

import com.flo.administrationservice.entity.User;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserService extends UserDetailsService {
    User findById(Long id);
    User findByUsername(String username);
}
