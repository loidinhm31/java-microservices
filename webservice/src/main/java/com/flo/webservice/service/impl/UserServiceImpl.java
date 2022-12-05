package com.flo.webservice.service.impl;

import com.flo.webservice.dto.UserDto;
import com.flo.webservice.entity.User;
import com.flo.webservice.exception.ObjectNotFoundException;
import com.flo.webservice.repository.UserRepository;
import com.flo.webservice.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl implements UserService {
    private final UserRepository userRepository;

    @Autowired
    public UserServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public List<UserDto> getAll() {
        List<User> users = userRepository.findAll();

        List<UserDto> userDtoList = users.stream().map(user -> {
            UserDto userDto = new UserDto();
            userDto.setId(user.getId());
            userDto.setName(user.getName());
            return userDto;
        }).collect(Collectors.toList());

        return userDtoList;
    }

    @Override
    public UserDto getOneById(long id) {
        Optional<User> optionalUser = userRepository.findById(id);
        if (optionalUser.isEmpty())
            throw new ObjectNotFoundException(String.format("cannot find user id: %s", id));

        User user = optionalUser.get();

        UserDto userDto = new UserDto();
        userDto.setId(user.getId());
        userDto.setName(user.getName());

        return userDto;
    }

    @Override
    public void deleteById(long id) {
        userRepository.deleteById(id);
    }

    @Override
    public UserDto save(UserDto user) {
        return null;
    }
}
