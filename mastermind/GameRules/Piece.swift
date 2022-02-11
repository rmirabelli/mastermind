//
//  Piece.swift
//  mastermind
//
//  Created by Russell Mirabelli on 1/25/22.
//

import Foundation

/// A game piece
struct Piece: Codable {
    /// The basic attribute of any game piece is its color
    let color: GameColor

    /// Create a game piece with  any color
    /// - Parameter color: The color of the piece
    init(_ color: GameColor) {
        self.color = color
    }
    
    /// A game piece with a random color.
    static var random: Piece {
        Piece(GameColor.random)
    }
    
    /// A game piece with no color (a play not yet made)
    static var empty: Piece {
        Piece(GameColor.none)
    }
}

extension Piece: Equatable {}
