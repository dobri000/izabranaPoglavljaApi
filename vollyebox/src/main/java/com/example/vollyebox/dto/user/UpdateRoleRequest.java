package com.example.vollyebox.dto.user;

import com.example.vollyebox.domain.enumeration.Role;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UpdateRoleRequest {
    private Role role;
}
