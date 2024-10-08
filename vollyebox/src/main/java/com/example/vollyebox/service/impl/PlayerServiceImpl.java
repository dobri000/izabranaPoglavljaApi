package com.example.vollyebox.service.impl;

import com.example.vollyebox.domain.Player;
import com.example.vollyebox.repository.PlayerRepository;
import com.example.vollyebox.service.PlayerService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
@RequiredArgsConstructor
public class PlayerServiceImpl implements PlayerService {

    private final PlayerRepository playerRepository;

    @Override
    public Optional<Player> getPlayer(int playerId) {
        return playerRepository.findById(playerId);
    }

    @Override
    public Player addPlayer(Player player) {
        return playerRepository.save(player);
    }

    @Override
    public Player updatePlayer(Player player) {
        return playerRepository.save(player);
    }

    @Override
    public Set<Player> searchPlayers(String search) {
        Set<Player> players = new HashSet<>() {
        };
        String[] words = search.split(" ");
        for(String word : words) {
            players.addAll(playerRepository.findByFirstnameIgnoreCase(word));
            players.addAll(playerRepository.findByLastnameIgnoreCase(word));
        }
        return players;
    }

    @Override
    public void deletePlayer(int playerId) {
        Optional<Player> found = playerRepository.findById(playerId);
        if(found.isPresent()){
            Player player = found.get();
            playerRepository.delete(player);
        }
    }

    @Override
    public List<Player> getPlayers() {
        List<Player> players = playerRepository.findAll().stream().limit(3).toList();
        return players;
    }
}