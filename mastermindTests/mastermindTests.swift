//
//  mastermindTests.swift
//  mastermindTests
//
//  Created by Russell Mirabelli on 1/25/22.
//

import XCTest
@testable import mastermind

class mastermindTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testRowComparison_equal() throws {
        let firstRow = Row(pieces: [Piece(.green)])
        let secondRow = Row(pieces: [Piece(.green)])
        let comparison = firstRow.compareTo(secondRow)
        XCTAssertEqual(comparison.scores[0], RowScore.PieceScore.correct)
    }
    
    func testRowComparison_notEqual() throws {
        let firstRow = Row(pieces: [Piece(.green)])
        let secondRow = Row(pieces: [Piece(.blue)])
        let comparison = firstRow.compareTo(secondRow)
        XCTAssertEqual(comparison.scores[0], RowScore.PieceScore.incorrect)
    }
    
    func testRowComparison_wrongPlace() throws {
        let firstRow = Row(pieces: [Piece(.green), Piece(.yellow)])
        let secondRow = Row(pieces: [Piece(.yellow)])
        let comparison = secondRow.compareTo(firstRow)
        XCTAssertEqual(comparison.scores[0], RowScore.PieceScore.incorrectLocation)
    }
    
    func testRandom() throws {
        let random = Row.random
        print(random.pieces)
        XCTAssertFalse(random.pieces.isEmpty)
    }
    
    func testPush() throws {
        let starting = Row.empty
        let other = try starting.push(Piece(.red))
        print(other)
        print(other.compareTo(Row.empty))
        XCTAssert(other.compareTo(Row.empty).scores.contains(RowScore.PieceScore.incorrect))
    }
    
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
    
    func testSimulateGameWinOnSecondTurn() throws {
        var starting = Row.empty
        let other = Row(pieces: [Piece(.purple), Piece(.red), Piece(.orange), Piece(.green), Piece(.red), Piece(.orange)])
        starting = try starting.push(Piece(.purple))
        starting = try starting.push(Piece(.red))
        starting = try starting.push(Piece(.yellow))
        starting = try starting.push(Piece(.red))
        starting = try starting.push(Piece(.orange))
        starting = try starting.push(Piece(.green))
        print(starting)
        print(other)
        print(starting.compareTo(other))
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
