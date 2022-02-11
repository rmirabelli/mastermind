//
//  PieceButton.swift
//  mastermind
//
//  Created by Russell Mirabelli on 1/28/22.
//

import SwiftUI

struct PieceButton: View {
    var gameColor: GameColor
    @ObservedObject var gameState: GameState
    weak var caretaker: Caretaker?

    var body: some View {
        Button {
            do {
                gameState.turn.row = try gameState.turn.row.push(Piece(gameColor))
                try caretaker?.push(gameState)
            } catch {
                print(error)
            }
        } label: {
            Image(systemName: "circle.fill")
                .foregroundColor(gameColor.color)
                .scaleEffect(1.3)
                .frame(width: 44, height: 44, alignment: .center)
        }

    }
}

struct PieceButton_Previews: PreviewProvider {
    static var previews: some View {
        let gameState = GameState()
        VStack {
            Spacer()
            VStack {
                PieceButton(gameColor: GameColor.yellow, gameState: gameState)
                PieceButton(gameColor: GameColor.orange, gameState: gameState)
                PieceButton(gameColor: GameColor.purple, gameState: gameState)
                PieceButton(gameColor: GameColor.red, gameState: gameState)
                PieceButton(gameColor: GameColor.green, gameState: gameState)
                PieceButton(gameColor: GameColor.blue, gameState: gameState)
            }
            Spacer()
        }
    }
}
