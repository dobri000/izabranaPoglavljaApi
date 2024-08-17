package com.example.vollyebox.service.impl;

import com.example.vollyebox.domain.User;
import com.example.vollyebox.domain.enumeration.Role;
import com.example.vollyebox.dto.user.UserDto;
import com.example.vollyebox.repository.UserRepository;
import com.example.vollyebox.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;
import java.util.Optional;

@RequiredArgsConstructor
@Service
public class UserServiceImpl implements UserService {
    private final UserRepository userRepository;
    @Override
    public List<UserDto> getAllUsers() {
        List<User> users = userRepository.findAll();
        List<UserDto> userDtos = users.stream().map(user -> {
            return new UserDto(user.getId(), user.getFirstname(), user.getLastname(), user.getEmail(), user.getRole());
        }).toList();
        return userDtos;
    }

    @Override
    public User updateRole(int id, Role role) {
        Optional<User> foundUser = userRepository.findById(id);
        if(foundUser.isEmpty()){
            throw new ResponseStatusException(
                    HttpStatus.NOT_FOUND, "entity not found"
            );
        }
        User user = foundUser.get();
        user.setRole(role);
        return userRepository.save(user);
    }
}
