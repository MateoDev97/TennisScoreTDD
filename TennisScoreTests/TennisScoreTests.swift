//
//  TennisScoreTests.swift
//  TennisScoreTests
//
//  Created by Mateo Ortiz on 17/03/23.
//

import XCTest
import TennisScore

final class TennisScoreTests: XCTestCase {

    func testGameInitializedWithZeroPointsForEachPlayer() {
        let tennisGame = TennisGame()
        
        XCTAssertTrue((tennisGame.score[0], tennisGame.score[1]) == (.zero, .zero))
    }
    
    func testIncrementScoreForPlayer1() {
        let tennisGame = TennisGame()
        
        tennisGame.incrementScore(player: .one)
        
        XCTAssertTrue((tennisGame.score[0], tennisGame.score[1]) == (.fifteen, .zero))
    }
    
    func testThreePointsForPlayer1() {
        let tennisGame = TennisGame()
        
        tennisGame.incrementScore(player: .one)
        tennisGame.incrementScore(player: .one)
        tennisGame.incrementScore(player: .one)
        
        XCTAssertTrue((tennisGame.score[0], tennisGame.score[1]) == (.forty, .zero))
    }
    
    func testFortyFortyScore() {
        let tennisGame = TennisGame()
        
        tennisGame.incrementScore(player: .one)
        tennisGame.incrementScore(player: .one)
        tennisGame.incrementScore(player: .one)
        
        tennisGame.incrementScore(player: .two)
        tennisGame.incrementScore(player: .two)
        tennisGame.incrementScore(player: .two)
        
        XCTAssertTrue((tennisGame.score[0], tennisGame.score[1]) == (.forty, .forty))
    }
    
    func testAdvantageForPlayer1() {
        let tennisGame = TennisGame()
        
        tennisGame.incrementScore(player: .one)
        tennisGame.incrementScore(player: .one)
        tennisGame.incrementScore(player: .one)
        
        tennisGame.incrementScore(player: .two)
        tennisGame.incrementScore(player: .two)
        tennisGame.incrementScore(player: .two)
        
        tennisGame.incrementScore(player: .one)
        
        XCTAssertTrue((tennisGame.score[0], tennisGame.score[1]) == (.advantage, .forty))
    }
    
    func testAdvantageForPlayer2AfterAdvantageForPlayer1() {
        let tennisGame = TennisGame()
        
        tennisGame.incrementScore(player: .one)
        tennisGame.incrementScore(player: .one)
        tennisGame.incrementScore(player: .one)
        
        tennisGame.incrementScore(player: .two)
        tennisGame.incrementScore(player: .two)
        tennisGame.incrementScore(player: .two)
        
        tennisGame.incrementScore(player: .one)
        
        XCTAssertTrue((tennisGame.score[0], tennisGame.score[1]) == (.advantage, .forty))
        
        tennisGame.incrementScore(player: .two)
        
        XCTAssertTrue((tennisGame.score[0], tennisGame.score[1]) == (.forty, .forty))
        tennisGame.incrementScore(player: .two)
        
        XCTAssertTrue((tennisGame.score[0], tennisGame.score[1]) == (.forty, .advantage))
    }
    
    func testGameWonForPlayer2() {
        let tennisGame = TennisGame()
        
        tennisGame.incrementScore(player: .one)
        tennisGame.incrementScore(player: .one)
        tennisGame.incrementScore(player: .one)
        
        tennisGame.incrementScore(player: .two)
        tennisGame.incrementScore(player: .two)
        tennisGame.incrementScore(player: .two)
        
        tennisGame.incrementScore(player: .one)
        
        XCTAssertTrue((tennisGame.score[0], tennisGame.score[1]) == (.advantage, .forty))
        
        tennisGame.incrementScore(player: .two)
        
        XCTAssertTrue((tennisGame.score[0], tennisGame.score[1]) == (.forty, .forty))
        tennisGame.incrementScore(player: .two)
        
        XCTAssertTrue((tennisGame.score[0], tennisGame.score[1]) == (.forty, .advantage))
        
        tennisGame.incrementScore(player: .two)
        
        XCTAssertTrue((tennisGame.games[0], tennisGame.games[1]) == (0, 1))
        XCTAssertTrue((tennisGame.score[0], tennisGame.score[1]) == (.zero, .zero))
    }
}
