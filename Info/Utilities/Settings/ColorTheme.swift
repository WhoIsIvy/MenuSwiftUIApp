//
//  ColorTheme.swift
//  Info
//
//  Created by Lisa Fellows on 3/10/25.
//

import SwiftUI

enum ColorTheme: String, CaseIterable, Identifiable {
    case blue, green, pink, purple

    var color: Color {
        switch self {
        case .blue:
            return .customBlue
        case .green:
            return .customGreen
        case .pink:
            return .customPink
        case .purple:
            return .customPurple
        }
    }

    var id: String { "ColorTheme\(self.rawValue)" }
}
