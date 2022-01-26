//
//  Row.swift
//  mastermind
//
//  Created by Russell Mirabelli on 1/25/22.
//

import Foundation

struct Row {
    let pieces: [Piece]
    
    var rowLength: Int {
        6
    }
    
    var colors: [Color] {
        pieces.map { $0.color }
    }
    
    func compareTo(_ other: Row) -> RowScore {
        let zipped = zip(colors, other.colors)
        let mapped: [RowScore.PieceScore] = zipped.map { pair in
            if pair.0 == pair.1 {
                return RowScore.PieceScore.correct
            }
            if other.colors.contains(pair.0) {
                return RowScore.PieceScore.incorrectLocation
            }
            return RowScore.PieceScore.incorrect
        }
        return RowScore(scores: mapped)
    }
}
