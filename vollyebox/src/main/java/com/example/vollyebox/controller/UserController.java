package com.example.vollyebox.controller;

import com.example.vollyebox.domain.User;
import com.example.vollyebox.domain.enumeration.Role;
import com.example.vollyebox.dto.user.UpdateRoleRequest;
import com.example.vollyebox.dto.user.UserDto;
import com.example.vollyebox.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {

    private final UserService userService;


    @GetMapping
    public List<UserDto> getUsers() {
        return userService.getAllUsers();
    }

    @PutMapping("/{id}")
    public User updateRole(@PathVariable("id") int id, @RequestBody UpdateRoleRequest request) {
        return userService.updateRole(id, request.getRole());
    }

}
