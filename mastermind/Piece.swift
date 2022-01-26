//
//  Piece.swift
//  mastermind
//
//  Created by Russell Mirabelli on 1/25/22.
//

import Foundation

struct Piece {
    let color: Color
    
    init(_ color: Color) {
        self.color = color
    }
    
    static var random: Piece {
        Piece(Color.random)
    }
    
    static var empty: Piece {
        Piece(Color.none)
    }
}

extension Piece: Equatable {
    
}
