//
//  mastermindTests.swift
//  mastermindTests
//
//  Created by Russell Mirabelli on 1/25/22.
//

import XCTest
@testable import mastermind

class mastermindTests: XCTestCase {

    /// Ensure that the equal computation works
    func testRowComparison_equal() throws {
        let firstRow = Row(pieces: [Piece(.green)])
        let secondRow = Row(pieces: [Piece(.green)])
        let comparison = firstRow.compareTo(secondRow)
        XCTAssertEqual(comparison.scores[0], RowScore.PieceScore.correct)
    }
    
    /// Ensure that the "Not Equal" computation works
    func testRowComparison_notEqual() throws {
        let firstRow = Row(pieces: [Piece(.green)])
        let secondRow = Row(pieces: [Piece(.blue)])
        let comparison = firstRow.compareTo(secondRow)
        XCTAssertEqual(comparison.scores[0], RowScore.PieceScore.incorrect)
    }
    
    /// Ensure that the "wrong place" evaluation works
    /// (THIS TEST IS FRAGILE)
    func testRowComparison_wrongPlace() throws {
        let firstRow = Row(pieces: [Piece(.green), Piece(.yellow)])
        let secondRow = Row(pieces: [Piece(.yellow)])
        let comparison = secondRow.compareTo(firstRow)
        XCTAssertEqual(comparison.scores[0], RowScore.PieceScore.incorrectLocation)
    }
    
    /// Ensure that random rows can be generated
    func testRandom() throws {
        let random = Row.random
        XCTAssertFalse(random.pieces.isEmpty)
    }
    
    /// Ensure we can push an element into a row
    func testPush() throws {
        let starting = Row.empty
        let other = try starting.push(Piece(.red))
        XCTAssert(other.compareTo(Row.empty).scores.contains(RowScore.PieceScore.incorrect))
    }
    
    /// This game is won on the first turn.
    func testSimulateGameWinOnFirstTurn() throws {
        var starting = Row.empty
        let other = Row(pieces: [Piece(.purple), Piece(.red), Piece(.orange), Piece(.green), Piece(.red), Piece(.orange)])
        starting = try starting.push(Piece(.purple))
        starting = try starting.push(Piece(.red))
        starting = try starting.push(Piece(.orange))
        starting = try starting.push(Piece(.green))
        starting = try starting.push(Piece(.red))
        starting = try starting.push(Piece(.orange))
        XCTAssertEqual(starting.compareTo(other), RowScore.victory)
    }
    
    /// This test ensures that the values in constants have not changed.
    /// If the value change, some of the other tests may fail.
    func testEnsureConstantsHaveNotChanged() throws {
        XCTAssertEqual(GameConstants.pieces, 6)
        XCTAssertEqual(GameConstants.rows, 10)
    }
    
    /// This game is won on the second turn.
    func testSimulateGameWinOnSecondTurn() throws {
        var starting = Row.empty
        let other = Row(pieces: [Piece(.purple), Piece(.red), Piece(.orange), Piece(.green), Piece(.red), Piece(.orange)])
        starting = try starting.push(Piece(.purple))
        starting = try starting.push(Piece(.red))
        starting = try starting.push(Piece(.yellow))
        starting = try starting.push(Piece(.red))
        starting = try starting.push(Piece(.orange))
        starting = try starting.push(Piece(.green))
        XCTAssertNotEqual(starting.compareTo(other), RowScore.victory)
        starting = Row.empty
        starting = try starting.push(Piece(.purple))
        starting = try starting.push(Piece(.red))
        starting = try starting.push(Piece(.orange))
        starting = try starting.push(Piece(.green))
        starting = try starting.push(Piece(.red))
        starting = try starting.push(Piece(.orange))
        XCTAssertEqual(starting.compareTo(other), RowScore.victory)

    }

}
