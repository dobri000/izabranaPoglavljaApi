package com.example.vollyebox.service;

import com.example.vollyebox.domain.User;
import com.example.vollyebox.domain.enumeration.Role;
import com.example.vollyebox.dto.user.UserDto;

import java.util.List;

public interface UserService {
    public List<UserDto> getAllUsers();
    public User updateRole(int id, Role role);

}
