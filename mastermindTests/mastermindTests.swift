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

}
