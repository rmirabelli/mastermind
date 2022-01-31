//
//  InputView.swift
//  mastermind
//
//  Created by Russell Mirabelli on 1/28/22.
//

import SwiftUI

struct InputView: View {
    @ObservedObject var gameState: GameState

    var body: some View {
        VStack {
            RowView(row: gameState.turn.row)
            HStack {
                PieceButton(gameColor: .red, gameState: gameState)
                PieceButton(gameColor: .yellow, gameState: gameState)
                PieceButton(gameColor: .green, gameState: gameState)
                PieceButton(gameColor: .blue, gameState: gameState)
                PieceButton(gameColor: .orange, gameState: gameState)
                PieceButton(gameColor: .purple, gameState: gameState)
            }
            HStack {
                Spacer()
                Button {
                    // IMPLEMENT UNDO HERE
                } label: {
                    Image(systemName: "arrow.left.circle")
                }
                Spacer()
                Button {
                    gameState.submit()
                    gameState.turn.row = Row.empty
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
