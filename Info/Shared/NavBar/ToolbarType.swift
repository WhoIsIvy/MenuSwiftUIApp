//
//  ToolbarType.swift
//  Info
//
//  Created by Lisa Fellows on 3/9/25.
//

import SwiftUI

enum ToolbarType: String, Identifiable {
    var id: String { self.rawValue }

    case colorTheme, cycleSpeed, playTime, edit, actionOne, actionTwo
    
    var iconImage: SystemImageHelper? {
        switch self {
        case .colorTheme: return .paintpalette
        case .cycleSpeed: return .speedometer
        case .playTime: return .clock
        case .actionOne: return .tv
        case .actionTwo: return .keyboard
        default: return nil
        }
    }

    var sheetType: Sheet? {
        switch self {
        case .colorTheme: return .colorTheme
        case .cycleSpeed: return .cycleSpeed
        case .playTime: return .playTime
        default: return nil
        }
    }

    var pageType: Page? {
        switch self {
        case .actionOne: return .actionOne
        case .actionTwo: return .actionTwo
        default: return nil
        }
    }
}
