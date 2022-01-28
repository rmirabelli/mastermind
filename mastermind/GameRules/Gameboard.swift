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

    func push(_ newRow: Row) -> Gameboard {
        var newRows = rows
        if let index = rows.firstIndex(of: Row.empty) {
            newRows[index] = newRow
        }
        return Gameboard(rows: newRows)
    }
    
    /// Creates an empty gameboard
    init() {
        rows = Array<Row>.init(repeating: Row.empty, count: GameConstants.rows)
    }

    init(rows: [Row]) {
        self.rows = rows
    }
}
