package com.example.userscoreservice.repositories;

import com.example.userscoreservice.entities.GamesScoreRecordEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GamesScoreRecordRepository extends JpaRepository<GamesScoreRecordEntity, Integer> {
}
