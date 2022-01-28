//
//  InputView.swift
//  mastermind
//
//  Created by Russell Mirabelli on 1/28/22.
//

import SwiftUI

struct InputView: View {
    var body: some View {
        Button {
            print("tapped")
        } label: {
            Image(systemName: "circle.fill")
                .foregroundColor(.red)
        }
        .scaleEffect(CGSize(width: 1.2, height: 1.2))
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView()
    }
}
