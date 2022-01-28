//
//  ScorePieceView.swift
//  mastermind
//
//  Created by Russell Mirabelli on 1/28/22.
//

import SwiftUI

struct ScorePieceView: View {
    let scorePiece: RowScore.PieceScore

    var body: some View {
        switch scorePiece {
        case .correct:
            return Image(systemName: "checkmark.circle")
                .foregroundColor(.green)
        case .incorrect:
            return Image(systemName: "x.circle")
                .foregroundColor(.red)
        case .incorrectLocation:
            return Image(systemName: "questionmark.circle")
                .foregroundColor(.orange)
        case .empty:
            return Image(systemName: "circle")
                .foregroundColor(.black)
        }
    }
}

struct ScorePieceView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            ScorePieceView(scorePiece: .correct)
            ScorePieceView(scorePiece: .incorrect)
            ScorePieceView(scorePiece: .incorrectLocation)
        }
    }
}
