//
//  Row.swift
//  mastermind
//
//  Created by Russell Mirabelli on 1/25/22.
//

import Foundation

struct Row {
    /// The game pieces within the row
    let pieces: [Piece]

    /// Returns a row where each piece is a random value. Useful for creating
    /// the eventual scored row
    static var random: Row {
        let placeholder = Array<Int>.init(repeating: 0, count: GameConstants.pieces)
        let pieces = placeholder.map { _ in Piece(GameColor.random) }
        return Row(pieces: pieces)
    }
    
    /// Returns a row where each piece is clear
    static var empty: Row {
        return Row(pieces: Array<Piece>.init(repeating: Piece.init(.none), count: GameConstants.pieces))
    }
    
    /// Returns true if all of the elements have been set
    /// - Returns: false if any element is empty
    func isFull() -> Bool {
        !pieces.contains(where: { piece in
            piece == Piece.empty
        })
    }
    
    /// Places a new `Piece` in this row, replacing the first empty element
    /// - Parameter piece: a piece to place
    /// - Returns: A copy of this row, but now with the new piece.
    func push(_ piece: Piece) throws -> Row {
        guard let index = pieces.firstIndex(of: Piece.empty) else { throw GameplayError.rowFull }
        var newPieces = pieces
        newPieces[index] = piece
        return Row(pieces: newPieces)
    }
        
    /// Creates a `RowScore` based on how the two rows compare to one another
    /// - Parameter other: The other `Row`
    /// - Returns: a `RowScore`
    func compareTo(_ other: Row) -> RowScore {
        let zipped = zip(pieces, other.pieces)
        let mapped: [RowScore.PieceScore] = zipped.map { pair in
            if pair.0 == pair.1 {
                return RowScore.PieceScore.correct
            }
            // This may need to be revised to disinclude any
            // correct values
            // FIXME???
            if other.pieces.contains(pair.0) {
                return RowScore.PieceScore.incorrectLocation
            }
            return RowScore.PieceScore.incorrect
        }
        return RowScore(scores: mapped)
    }
}
