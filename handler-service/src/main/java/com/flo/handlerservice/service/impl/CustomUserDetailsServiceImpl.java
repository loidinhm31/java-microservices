package com.flo.handlerservice.service.impl;

import com.flo.handlerservice.dto.RoleDto;
import com.flo.handlerservice.dto.UserDto;
import com.flo.handlerservice.dto.UserRoleDto;
import com.flo.handlerservice.exception.UserSecurityException;
import com.flo.handlerservice.feign.client.AdministrationClient;
import com.flo.handlerservice.service.CustomUserDetailsService;
import org.apache.commons.lang3.tuple.Pair;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class CustomUserDetailsServiceImpl implements CustomUserDetailsService {
    private final Logger LOG = LoggerFactory.getLogger(CustomUserDetailsServiceImpl.class);
    private final AdministrationClient administrationClient;

    public CustomUserDetailsServiceImpl(AdministrationClient administrationClient) {
        this.administrationClient = administrationClient;
    }

    @Override
    public Pair<UserDto, Collection<? extends GrantedAuthority>> loadUserBySso(String sso) throws UserSecurityException {
        UserDto userDto;
        try {
            userDto = administrationClient.retrieveRolesForUser(sso).getBody();
        } catch (Exception e) {
            LOG.error("Security exception: ", e);
            throw new UserSecurityException(e.getMessage());
        }

        Collection<? extends GrantedAuthority> grantedAuthorities =
                (userDto == null) ? Collections.singletonList(new SimpleGrantedAuthority("unauthorized"))
                        : getAuthorities(userDto);
        return Pair.of(userDto, grantedAuthorities);
    }

    private Collection<? extends GrantedAuthority> getAuthorities(UserDto userDto) {
        List<RoleDto> roleDtos = userDto.getUserRoles().stream()
                .map(UserRoleDto::getRole)
                .collect(Collectors.toList());

        List<GrantedAuthority> authorities = new ArrayList<>();
        roleDtos.forEach(r -> authorities.add(new SimpleGrantedAuthority(r.getRoleCode().getName())));
        return authorities;
    }
}
