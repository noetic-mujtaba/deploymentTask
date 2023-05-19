package com.example.userscoreservice.services.impl;

import com.example.userscoreservice.entities.GamesScoreRecordEntity;
import com.example.userscoreservice.repositories.GamesScoreRecordRepository;
import com.example.userscoreservice.services.GamesRecordService;
import org.springframework.stereotype.Service;

@Service
public class GamesRecordServiceImpl implements GamesRecordService {
    private final GamesScoreRecordRepository gamesScoreRecordRepository;

    public GamesRecordServiceImpl(GamesScoreRecordRepository gamesScoreRecordRepository) {
        this.gamesScoreRecordRepository = gamesScoreRecordRepository;
    }

    @Override
    public void storeGamesRecord(GamesScoreRecordEntity entity) {
        gamesScoreRecordRepository.save(entity);
    }
}
