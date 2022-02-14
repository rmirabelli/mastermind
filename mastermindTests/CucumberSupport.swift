//
//  CucumberSupport.swift
//  mastermindTests
//
//  Created by Russell Mirabelli on 2/14/22.
//

import XCTest
import CucumberSwift
@testable import mastermind

private var gameState = GameState()
private var caretaker = Caretaker()

extension Cucumber: StepImplementation {
    public var bundle: Bundle {
        class ThisBundle { }
        return Bundle(for: ThisBundle.self)
    }
    public func setupSteps() {
        Given("^the game has (.*?) guesses in its input$") { matches, _ in
            gameState = GameState()
            caretaker.reset()
            do {
                let count = try XCTUnwrap(Int(matches[1]))
                for _ in 0..<count {
                    try caretaker.push(gameState)
                    try gameState.turn.row = gameState.turn.row.push(Piece(.orange))
                }
                XCTAssertEqual(count,
                      gameState.turn.row.pieces.filter { $0 != Piece(.none) }.count)
            } catch {
                XCTFail(error.localizedDescription)
            }
        }
        When("^the user selects undo$") { _, _ in
                    gameState = try! caretaker.pop()
                }
        Then("^the game has (.*?) guesses in its input$") { matches, _ in
            do {
                let count = try XCTUnwrap(Int(matches[1]))
                XCTAssertEqual(count, gameState.turn.row.pieces
                                    .filter { $0 != Piece(.none) }.count)
            } catch {
                XCTFail(error.localizedDescription)
            }
        }
        Given("^the game has four submitted rows and no guesses$") { _, _ in
            gameState = GameState()
            caretaker.reset()
            do {
                for _ in 0..<4 {
                    for _ in 0..<GameConstants.pieces {
                        gameState.turn.row = try gameState.turn.row.push(Piece(.orange))
                        try caretaker.push(gameState)
                        gameState.submit()
                    }
                }
            } catch {
                XCTFail(error.localizedDescription)
            }
            XCTAssertEqual(4, gameState.gameboard.rows.filter { $0 != Row.empty }.count)
            XCTAssertEqual(0, gameState.turn.row.pieces.filter { $0 != Piece(.none) }.count)
        }
       Then("^the game has three submitted rows and six guesses$") { _, _ in
            XCTAssertEqual(3, gameState.gameboard.rows.filter { $0 != Row.empty }.count)
            XCTAssertEqual(6, gameState.turn.row.pieces.filter { $0 != Piece(.none) }.count)
        }    }
}


class CucumberSupport: XCTestCase {
}
