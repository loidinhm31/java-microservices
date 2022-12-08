package com.flo.administrationservice.service.impl;

import com.flo.administrationservice.entity.User;
import com.flo.administrationservice.repository.UserRepository;
import com.flo.administrationservice.security.CustomUserDetail;
import com.flo.administrationservice.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;

    @Autowired
    public UserServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public User findByUsername(String username) {
        System.out.println("a1");

        return userRepository.findByUsername(username);

    }

    @Override
    public User findById(Long id) {
        Optional<User> user = userRepository.findById(id);

        return user.orElse(null);

    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByUsername(username);



        if (user == null) {
            throw new UsernameNotFoundException(username);
        }

        return new CustomUserDetail(user);
    }
}
