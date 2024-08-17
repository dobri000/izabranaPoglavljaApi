package com.example.vollyebox.service;

import com.example.vollyebox.domain.Player;

import java.util.List;
import java.util.Optional;
import java.util.Set;

public interface PlayerService {

public Optional<Player> getPlayer(int playerId);
public Player addPlayer(Player player);
public Player updatePlayer(Player player);

public Set<Player> searchPlayers(String search);

public void deletePlayer(int playerId);
public List<Player> getPlayers();

}
