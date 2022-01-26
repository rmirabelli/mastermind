//
//  RowScore.swift
//  mastermind
//
//  Created by Russell Mirabelli on 1/25/22.
//

import Foundation

struct RowScore {
    enum PieceScore {
        case correct
        case incorrectLocation
        case incorrect
    }
    let scores: [PieceScore]
}
