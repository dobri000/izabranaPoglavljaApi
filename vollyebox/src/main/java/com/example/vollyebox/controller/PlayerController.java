package com.example.vollyebox.controller;

import com.example.vollyebox.domain.Player;

import com.example.vollyebox.domain.Team;
import com.example.vollyebox.service.PlayerService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
import java.util.Set;

@RestController
@RequestMapping("/player")
@RequiredArgsConstructor
public class PlayerController {

    private final PlayerService playerService;

    @GetMapping("/all")
    public ResponseEntity<List<Player>> getPlayers() {
        List<Player> players = playerService.getPlayers();
        return ResponseEntity.ok(players);
    }


    @GetMapping("/{playerId}")
    public ResponseEntity<Player> getPlayer(@PathVariable("playerId") int playerId) {
        Optional<Player> player = playerService.getPlayer(playerId);
        if(player.isEmpty()){
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(player.get());
    }

    @PostMapping()
    public ResponseEntity<Player> addPlayer(@RequestBody Player player) {
        player = playerService.addPlayer(player);
        return ResponseEntity.ok(player);
    }

    @PutMapping()
    public ResponseEntity<String> updatePlayer(
            @RequestBody Player player
    ) {
        player = playerService.updatePlayer(player);
        if(player == null){
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok("Player is successfully updated");
    }

    @GetMapping()
    public ResponseEntity<Set<Player>> searchPlayers(@RequestParam String search) {
        Set<Player> players = playerService.searchPlayers(search);
        return ResponseEntity.ok(players);
    }

    @DeleteMapping("/{playerId}")
    public ResponseEntity<String> deletePlayer(@PathVariable("playerId") int playerId){
        playerService.deletePlayer(playerId);
        return ResponseEntity.ok("Player was successfully deleted");
    }

}
