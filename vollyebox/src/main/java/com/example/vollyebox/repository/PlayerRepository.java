package com.example.vollyebox.repository;

import com.example.vollyebox.domain.Player;
import com.example.vollyebox.domain.Team;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface PlayerRepository extends JpaRepository<Player, Integer> {

    List<Player> findByFirstnameIgnoreCase(String search);
    List<Player> findByLastnameIgnoreCase(String search);


}
