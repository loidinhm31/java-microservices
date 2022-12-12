package com.flo.administrationservice.service;

import org.springframework.security.core.userdetails.UserDetails;

public interface UserInfoService {
    UserDetails loadUserBySso(String userSso);
}
