//
//  CoordinateType.swift
//  Info
//
//  Created by Lisa Fellows on 3/9/25.
//

import Foundation

enum CoordinateType { case page, sheet }

enum Page: Hashable {
    case menu
    case actionOne
    case actionTwo
    case list(String)
}

enum Sheet: String, Identifiable {
    var id: String { self.rawValue }
    case colorTheme
    case playTime
    case cycleSpeed
    case fileOptions
}

