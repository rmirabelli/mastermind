//
//  PieceView.swift
//  mastermind
//
//  Created by Russell Mirabelli on 1/28/22.
//

import SwiftUI

struct PieceView: View {

    let piece: Piece

    var body: some View {
        switch piece.color {
        case .none:
            Image(systemName: "circle")
                .foregroundStyle(.black)
        default:
            Image(systemName: "circle.fill")
                .foregroundStyle(piece.color.color)
        }
    }

}

struct PieceView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            VStack {
                PieceView(piece: Piece(.none))
                PieceView(piece: Piece(.green))
                PieceView(piece: Piece(.red))
                PieceView(piece: Piece(.blue))
                PieceView(piece: Piece(.yellow))
                PieceView(piece: Piece(.orange))
                PieceView(piece: Piece(.purple))
            }
        }
    }
}
