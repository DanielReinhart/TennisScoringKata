//
//  TennisScoringKataTests.swift
//  TennisScoringKataTests
//
//  Created by Daniel Reinhart on 3/17/17.
//  Copyright © 2017 Daniel Reinhart. All rights reserved.
//

import XCTest
@testable import TennisScoringKata

class TennisScoringKataTests: XCTestCase {
    func testInitialGameScore() {
        let game = Game()
        XCTAssertEqual(game.score, "0 - 0")
    }

    func testServingPlayerWinningOnePoint() {
        let game = Game()
        game.servingPlayerWinPoint()
        XCTAssertEqual(game.score, "15 - 0")
    }

    func testReceivingPlayerWinningOnePoint() {
        let game = Game()
        game.receivingPlayerWinPoint()

        XCTAssertEqual(game.score, "0 - 15")
    }

    func testBothPlayersWinOnePoint() {
        let game = Game()

        game.servingPlayerWinPoint()
        game.receivingPlayerWinPoint()

        XCTAssertEqual(game.score, "15 - 15")
    }

    func testServingPlayerWinningTwoPoints() {
        let game = Game()
        game.servingPlayerWinPoint()
        game.servingPlayerWinPoint()
        XCTAssertEqual(game.score, "30 - 0")
    }

    func testServingPlayerWinTwoPointsReceivingPlayerOnePoint() {
        let game = Game()
        game.servingPlayerWinPoint()
        game.servingPlayerWinPoint()

        game.receivingPlayerWinPoint()
        XCTAssertEqual(game.score, "30 - 15")
    }

    func testServingPlayerWinThreePoints() {
        let game = Game()
        game.servingPlayerWinPoint()
        game.servingPlayerWinPoint()
        game.servingPlayerWinPoint()

        XCTAssertEqual(game.score, "40 - 0")
    }

    func testReceivingPlayerWinThreePoints() {
        let game = Game()

        game.receivingPlayerWinPoint()
        game.receivingPlayerWinPoint()
        game.receivingPlayerWinPoint()

        XCTAssertEqual(game.score, "0 - 40")
    }

    func testScoreIsDeuce() {
        let game = Game()

        game.receivingPlayerWinPoint()
        game.receivingPlayerWinPoint()
        game.receivingPlayerWinPoint()

        game.servingPlayerWinPoint()
        game.servingPlayerWinPoint()
        game.servingPlayerWinPoint()

        XCTAssertEqual(game.score, "Deuce")
    }
}
