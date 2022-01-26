//
//  GameState.swift
//  mastermind
//
//  Created by Russell Mirabelli on 1/25/22.
//

import Foundation

struct GameState {
    /// The gameboard for this game
    let gameboard: Gameboard
    
    /// The current turn
    let turn: Turn
    
    /// The solution for this game
    let solution: Row
}
