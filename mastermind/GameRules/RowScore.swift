//
//  RowScore.swift
//  mastermind
//
//  Created by Russell Mirabelli on 1/25/22.
//

import Foundation

/// The score for the current row
struct RowScore {
    /// A score for a single piece on the row
    enum PieceScore {
        case correct
        case incorrectLocation
        case incorrect
        case empty
    }
    
    /// The scores for this row
    let scores: [PieceScore]
    
    /// A full victory
    static var victory: RowScore {
        RowScore(scores: Array<PieceScore>.init(repeating: .correct, count: GameConstants.pieces))
    }

    /// No score yet
    static var empty: RowScore {
        RowScore(scores: Array<PieceScore>.init(repeating: .empty, count: GameConstants.pieces))
    }
}

extension RowScore: Equatable {}
