package com.flo.administrationservice.security;

import com.flo.administrationservice.entity.Role;
import com.flo.administrationservice.entity.User;
import com.flo.administrationservice.entity.UserRole;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.stream.Collectors;

public class CustomUserDetail implements UserDetails {

    private static final long serialVersionUID = 1L;

    private final User user;

    public CustomUserDetail(User theUser) {
        this.user = theUser;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        Collection<Role> roles = user.getUserRoles().stream()
                .map(UserRole::getRole)
                .toList();

        return roles.stream().map(role -> new SimpleGrantedAuthority(role.getRoleName()))
                .collect(Collectors.toList());

    }

    @Override
    public String getPassword() {

        return user.getUserPassword();
    }

    @Override
    public String getUsername() {

        return user.getUsername();
    }

    @Override
    public boolean isAccountNonExpired() {

        return true;
    }

    @Override
    public boolean isAccountNonLocked() {

        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {

        return true;
    }

    @Override
    public boolean isEnabled() {

        return true;
    }

}