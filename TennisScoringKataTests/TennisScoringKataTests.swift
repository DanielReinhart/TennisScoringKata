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
}
