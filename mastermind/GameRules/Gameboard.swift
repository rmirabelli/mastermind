//
//  Gameboard.swift
//  mastermind
//
//  Created by Russell Mirabelli on 1/25/22.
//

import Foundation

struct Gameboard {
    /// The rows of pieces in the game; each row is a turn
    let rows: [Row]
    
    /// Creates an empty gameboard
    init() {
        rows = Array<Row>.init(repeating: Row.empty, count: GameConstants.rows)
    }
}
