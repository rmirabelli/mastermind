//
//  Color.swift
//  mastermind
//
//  Created by Russell Mirabelli on 1/25/22.
//

import Foundation

enum Color: CaseIterable {
    case red, green, blue, yellow, orange, purple
    case none
    
    static var random: Color {
        [Color.red, Color.green, Color.blue, Color.yellow, Color.orange, Color.purple].randomElement() ?? .none
    }
}
