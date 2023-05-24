package com.example.userscoreservice.controllers;

import com.example.userscoreservice.entities.GamesScoreRecordEntity;
import com.example.userscoreservice.responses.ApiResponse;
import com.example.userscoreservice.services.GamesRecordService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

@RestController
@RequestMapping("/api/")
public class GamesRecordController {
    private final GamesRecordService gamesRecordService;

    public GamesRecordController(GamesRecordService gamesRecordService) {
        this.gamesRecordService = gamesRecordService;
    }
    @PostMapping("/store-user-score")
    public ResponseEntity<?> storeGamesRecord(@RequestBody GamesScoreRecordEntity entity) {
        gamesRecordService.storeGamesRecord(entity);
        return new ResponseEntity<>(new ApiResponse("Records save successfully", true, new Date()), HttpStatus.CREATED);
    }
}