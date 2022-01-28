//
//  GameboardView.swift
//  mastermind
//
//  Created by Russell Mirabelli on 1/28/22.
//

import SwiftUI

struct GameboardView: View {
    let gameboard: Gameboard

    var body: some View {
        VStack {
            ForEach(0..<gameboard.rows.count, id: \.self) { item in
                RowView(row: gameboard.rows[item])
            }
        }
    }
}

struct GameboardView_Previews: PreviewProvider {
    static var previews: some View {
        GameboardView(gameboard: Gameboard())
    }
}
