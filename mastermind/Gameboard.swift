//
//  Gameboard.swift
//  mastermind
//
//  Created by Russell Mirabelli on 1/25/22.
//

import Foundation

struct Gameboard {
    /// The maximum number of turns in a game.
    /// TODO: this should be defined elsewhere
    static let maxTurns = 10
    
    /// The rows of pieces in the game; each row is a turn
    let rows: [Row]
    
    /// Creates an empty gameboard
    init() {
        rows = Array<Row>.init(repeating: Row.empty, count: Gameboard.maxTurns)
    }
}
