//
//  RowView.swift
//  mastermind
//
//  Created by Russell Mirabelli on 1/28/22.
//

import SwiftUI

struct RowView: View {

    let row: Row

    var body: some View {
        HStack() {
            ForEach(0..<row.pieces.count, id: \.self) { item in
                PieceView(piece: row.pieces[item])
            }
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            RowView(row: Row.random)
        }
    }
}
