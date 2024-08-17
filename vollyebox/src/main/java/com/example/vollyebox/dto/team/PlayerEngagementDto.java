package com.example.vollyebox.dto.team;

import com.example.vollyebox.domain.Player;
import com.example.vollyebox.domain.Season;
import com.example.vollyebox.domain.Team;
import com.example.vollyebox.domain.enumeration.PlayerPosition;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PlayerEngagementDto {
    private int playerEngagementId;
    private PlayerEngagementPlayerDto player;

    @JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "seasonId")
    @JsonIgnore
    private Season season;

    @Enumerated(EnumType.STRING)
    private PlayerPosition position;

    private int number;
}
