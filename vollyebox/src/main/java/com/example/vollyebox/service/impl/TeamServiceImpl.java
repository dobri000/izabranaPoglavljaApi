package com.example.vollyebox.service.impl;

import com.example.vollyebox.domain.PlayerEngagement;
import com.example.vollyebox.domain.Team;
import com.example.vollyebox.dto.team.GetTeamByIdResponse;
import com.example.vollyebox.dto.team.PlayerEngagementDto;
import com.example.vollyebox.dto.team.PlayerEngagementPlayerDto;
import com.example.vollyebox.repository.TeamRepository;
import com.example.vollyebox.service.PlayerEngagementService;
import com.example.vollyebox.service.TeamService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ser.impl.SimpleBeanPropertyFilter;
import com.fasterxml.jackson.databind.ser.impl.SimpleFilterProvider;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.server.ResponseStatusException;

import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class TeamServiceImpl implements TeamService {

    private final TeamRepository teamRepository;

    @Override
    public GetTeamByIdResponse getTeam(int teamId) {
        Optional<Team> teamOptional = teamRepository.findById(teamId);
        if(teamOptional.isEmpty()){
            throw new ResponseStatusException(
                    HttpStatus.NOT_FOUND, "entity not found"
            );
        }
        Team team = teamOptional.get();
        List<PlayerEngagementDto> playerEngagementDtos = team.getPlayerEngagements().stream().map(
                eng -> {
                    PlayerEngagementPlayerDto playerDto = new PlayerEngagementPlayerDto();
                    playerDto.setPlayerId(eng.getPlayer().getPlayerId());
                    playerDto.setFirstname(eng.getPlayer().getFirstname());
                    playerDto.setLastname(eng.getPlayer().getLastname());

                    PlayerEngagementDto dto = new PlayerEngagementDto();
                    dto.setPlayerEngagementId(eng.getPlayerEngagementId());
                    dto.setPlayer(playerDto);
                    dto.setNumber(eng.getNumber());
                    dto.setSeason(eng.getSeason());
                    dto.setPosition(eng.getPosition());

                    return dto;
                }
        ).toList();


        GetTeamByIdResponse response = new GetTeamByIdResponse();
        response.setTeamId(team.getTeamId());
        response.setTeamName(team.getTeamName());
        response.setHall(team.getHall());
        response.setFounded(team.getFounded());
        response.setLogo(team.getLogo());
        response.setCountry(team.getCountry());
        response.setEngagements(playerEngagementDtos.stream().collect(Collectors.groupingBy(PlayerEngagementDto::getSeason, Collectors.toList())));

        return response;
    }

    @Override
    public Team postTeam(Team team) {
        return teamRepository.save(team);
    }

    @Override
    public Team updateTeam(Team team) {
        return teamRepository.save(team);
    }

    @Override
    public List<Team> searchTeams(String search) {
        return teamRepository.getTeamsBySearch(search);
    }

    @Override
    public List<Team> getAllTeams() {
        return teamRepository.findAll();
    }

    @Override
    public void deleteTeam(int teamId) {
        Optional<Team> found = teamRepository.findById(teamId);
        if(found.isPresent()){
            Team team = found.get();
            teamRepository.delete(team);
        }
    }

    @Override
    public List<Team> getTeams() {
        List<Team> teams = teamRepository.findAll().stream().limit(3).toList();
        return teams;
    }
}
