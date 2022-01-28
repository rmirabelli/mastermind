//
//  GameState.swift
//  mastermind
//
//  Created by Russell Mirabelli on 1/25/22.
//

import Foundation

class GameState: ObservableObject {
    /// The gameboard for this game
    @Published var gameboard: Gameboard
    
    /// The current turn
    @Published var turn: Turn
    
    /// The solution for this game
    let solution: Row

    func submit() {
        if turn.row.isFull() {
            gameboard = gameboard.push(turn.row)
        }
    }

    var score: RowScore {
        if let row = gameboard.rows.firstIndex(of: Row.empty), row != 0 {
            return gameboard.rows[row-1].compareTo(solution)
        }
        return RowScore.empty
    }

    init() {
        gameboard = Gameboard()
        turn = Turn(row: Row.empty)
        solution = Row.random
    }
}
