//
//  Color.swift
//  mastermind
//
//  Created by Russell Mirabelli on 1/25/22.
//

import Foundation

/// The available game piece colors
enum Color {
    case red, green, blue, yellow, orange, purple
    case none
    
    /// A random game piece color; will not return `.none`
    static var random: Color {
        [Color.red, Color.green, Color.blue, Color.yellow, Color.orange, Color.purple].randomElement() ?? .none
    }
}
