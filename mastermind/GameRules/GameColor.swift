//
//  Color.swift
//  mastermind
//
//  Created by Russell Mirabelli on 1/25/22.
//

import SwiftUI

/// The available game piece colors
enum GameColor: Codable {
    case red, green, blue, yellow, orange, purple
    case none

    /// Separate definitions for SwiftUI
    var color: Color {
        switch self {
        case .red: return .red
        case .green: return .green
        case .blue: return .blue
        case .yellow: return .yellow
        case .orange: return .orange
        case .purple: return .purple
        case .none: return .white
        }
    }
    
    /// A random game piece color; will not return `.none`
    static var random: GameColor {
        [GameColor.red, GameColor.green, GameColor.blue, GameColor.yellow, GameColor.orange, GameColor.purple].randomElement() ?? .none
    }
}
