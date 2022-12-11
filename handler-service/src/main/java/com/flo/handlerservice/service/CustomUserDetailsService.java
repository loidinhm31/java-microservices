package com.flo.handlerservice.service;

import com.flo.handlerservice.dto.UserDto;
import com.flo.handlerservice.exception.UserSecurityException;
import org.apache.commons.lang3.tuple.Pair;
import org.springframework.security.core.GrantedAuthority;

import java.util.Collection;

public interface CustomUserDetailsService {

    Pair<UserDto, Collection<? extends GrantedAuthority>> loadUserBySso(String sso) throws UserSecurityException;

}
