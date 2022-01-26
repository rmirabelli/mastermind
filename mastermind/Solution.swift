//
//  Solution.swift
//  mastermind
//
//  Created by Russell Mirabelli on 1/25/22.
//

import Foundation

struct Solution {
    let row: Row
    init() {
        row = Row(pieces: [Piece(Color.random),
                           Piece(Color.random),
                           Piece(Color.random),
                           Piece(Color.random),
                           Piece(Color.random),
                           Piece(Color.random)
                          ])
    }
}
