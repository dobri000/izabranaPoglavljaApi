package com.example.vollyebox.service;

import com.example.vollyebox.domain.Team;
import com.example.vollyebox.dto.team.GetTeamByIdResponse;

import java.util.List;
import java.util.Optional;

public interface TeamService {

    public GetTeamByIdResponse getTeam(int teamId);
    public Team postTeam(Team team);
    public Team updateTeam(Team team);
    public List<Team> searchTeams(String search);
    public List<Team> getAllTeams();
    public void deleteTeam(int teamId);
    public List<Team> getTeams();


}
