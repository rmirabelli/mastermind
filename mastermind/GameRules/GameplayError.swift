//
//  GameplayError.swift
//  mastermind
//
//  Created by Russell Mirabelli on 1/25/22.
//

import Foundation

enum GameplayError: Error {
    case rowFull // tried to push a piece into an already-full row
}
