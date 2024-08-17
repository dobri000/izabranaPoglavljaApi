package com.example.vollyebox.dto.team;

import com.example.vollyebox.domain.*;
import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.Map;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GetTeamByIdResponse {
    private int teamId;
    private String teamName;
    private int founded;
    private String logo;
    private Hall hall;
    private Country country;
    private Map<Season, List<PlayerEngagementDto>> engagements;

}
