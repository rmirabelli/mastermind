//
//  InputView.swift
//  mastermind
//
//  Created by Russell Mirabelli on 1/28/22.
//

import SwiftUI

struct InputView: View {
    @ObservedObject var gameState: GameState
    weak var caretaker: Caretaker?

    var body: some View {
        VStack {
            RowView(row: gameState.turn.row)
            HStack {
                PieceButton(gameColor: .red, gameState: gameState, caretaker: caretaker)
                PieceButton(gameColor: .yellow, gameState: gameState, caretaker: caretaker)
                PieceButton(gameColor: .green, gameState: gameState, caretaker: caretaker)
                PieceButton(gameColor: .blue, gameState: gameState, caretaker: caretaker)
                PieceButton(gameColor: .orange, gameState: gameState, caretaker: caretaker)
                PieceButton(gameColor: .purple, gameState: gameState, caretaker: caretaker)
            }
            HStack {
                Spacer()
                Button {
                    if let state: GameState = try? caretaker?.pop() {
                        gameState.from(other: state)
                    }
                    // IMPLEMENT UNDO HERE
                } label: {
                    Image(systemName: "arrow.left.circle")
                }
                Spacer()
                Button {
                    gameState.submit()
                    gameState.turn.row = Row.empty
                    try? caretaker?.push(gameState)
                } label: {
                    Image(systemName: "arrow.right.circle")
                }
                Spacer()
            }
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        let gameState = GameState()
        InputView(gameState: gameState)
    }
}
