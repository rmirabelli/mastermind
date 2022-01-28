//
//  ScoreView.swift
//  mastermind
//
//  Created by Russell Mirabelli on 1/28/22.
//

import SwiftUI

struct ScoreView: View {
    let rowScore: RowScore

    var body: some View {
        HStack {
            ForEach(0..<rowScore.scores.count, id: \.self) { item in
                ScorePieceView(scorePiece: rowScore.scores[item])
            }
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(rowScore: RowScore.victory)
    }
}
