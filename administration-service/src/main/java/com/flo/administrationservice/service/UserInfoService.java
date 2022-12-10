package com.flo.administrationservice.service;

import com.flo.administrationservice.entity.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserInfoService {
    UserDetails loadUserBySso(String userSso);
}
