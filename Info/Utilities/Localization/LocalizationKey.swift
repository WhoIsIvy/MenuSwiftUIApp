//
//  LocalizationKey.swift
//  Info
//
//  Created by Lisa Fellows on 3/8/25.
//

import Foundation

enum LocalizationKey: String.LocalizationValue {
    case actionOne
    case actionTwo
    case colorTheme
    case files
    case folders
    case menu
}

extension String {
    static func localization(key: LocalizationKey) -> String {
        .init(localized: key.rawValue)
    }
}
