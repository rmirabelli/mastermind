//
//  GameView.swift
//  mastermind
//
//  Created by Russell Mirabelli on 1/28/22.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var gameState: GameState

    var body: some View {
        VStack {
            Spacer()
            ScoreView(rowScore: gameState.score)
            Spacer()
            GameboardView(gameboard: gameState.gameboard)
            Spacer()
            InputView(gameState: gameState)
            Spacer()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(gameState: GameState())
    }
}
