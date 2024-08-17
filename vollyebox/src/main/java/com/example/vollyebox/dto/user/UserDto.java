package com.example.vollyebox.dto.user;

import com.example.vollyebox.domain.enumeration.Role;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserDto {
    private int id;
    private String firstname;
    private String lastname;
    private String email;
    private Role role;
}
