package com.example.vollyebox.repository;

import com.example.vollyebox.domain.PlayerEngagement;
import com.example.vollyebox.domain.Team;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PlayerEngagementRepository extends JpaRepository<PlayerEngagement, Integer> {
    List<PlayerEngagement> findAllByTeam(Team team);
}
