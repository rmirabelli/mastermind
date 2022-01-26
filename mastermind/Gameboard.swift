//
//  Gameboard.swift
//  mastermind
//
//  Created by Russell Mirabelli on 1/25/22.
//

import Foundation

struct Gameboard {
    static let maxTurns = 10
    let rows: [Row]
    
    init() {
        rows = Array<Row>.init(repeating: Row.empty, count: Gameboard.maxTurns)
    }
}
