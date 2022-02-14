//
//  GameState.swift
//  mastermind
//
//  Created by Russell Mirabelli on 1/25/22.
//

import Foundation

class GameState: ObservableObject, Codable {
    /// The gameboard for this game
    @Published var gameboard: Gameboard
    
    /// The current turn
    @Published var turn: Turn
    
    /// The solution for this game
    var solution: Row

    func submit() {
        if turn.row.isFull() {
            gameboard = gameboard.push(turn.row)
            turn.row = Row.empty
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

    enum CodingKeys: String, CodingKey {
        case gameboard, turn, solution
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(gameboard, forKey: .gameboard)
        try container.encode(turn, forKey: .turn)
        try container.encode(solution, forKey: .solution)
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        gameboard = try container.decode(Gameboard.self, forKey: .gameboard)
        turn = try container.decode(Turn.self, forKey: .turn)
        solution = try container.decode(Row.self, forKey: .solution)
    }

    func from(other: GameState) {
        gameboard = other.gameboard
        turn = other.turn
        solution = other.solution
    }

}
