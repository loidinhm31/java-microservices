package com.flo.administrationservice.service.impl;

import com.flo.administrationservice.config.security.CustomUser;
import com.flo.administrationservice.entity.Feature;
import com.flo.administrationservice.entity.RoleFeature;
import com.flo.administrationservice.entity.User;
import com.flo.administrationservice.entity.UserRole;
import com.flo.administrationservice.repository.UserRepository;
import com.flo.administrationservice.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserInfoServiceImpl implements UserInfoService {

    private final UserRepository userRepository;

    @Autowired
    public UserInfoServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public UserDetails loadUserBySso(String userSso) throws UsernameNotFoundException {
        User user = userRepository.findBySsoIgnoreCase(userSso);

        if (user == null) {
            throw new UsernameNotFoundException(userSso);
        }

        List<String> featureList;
        List<GrantedAuthority> grantedAuthorities = new ArrayList<>();

        featureList = user.getUserRoles().stream()
                .filter(UserRole::getActive)
                .map(userRole -> userRole.getRole().getRoleFeatures().stream()
                        .map(RoleFeature::getFeature)
                        .collect(Collectors.toList()))
                .flatMap(features -> features.stream()
                        .map(Feature::getFeatureCode))
                .collect(Collectors.toList());

        featureList.forEach(
            f -> grantedAuthorities.add(new SimpleGrantedAuthority(f))
        );

        return new CustomUser(userSso, "N/A", grantedAuthorities);
    }
}
