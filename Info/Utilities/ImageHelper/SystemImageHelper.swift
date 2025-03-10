//
//  SystemImageHelper.swift
//  Info
//
//  Created by Lisa Fellows on 3/8/25.
//

import SwiftUI

enum SystemImageHelper: String {
    case chevronRight = "chevron.right"
    case circleFill = "circle.fill"
    case clock
    case documentText = "doc.plaintext"
    case folder
    case keyboard
    case paintpalette
    case speedometer
    case tv
    case xmark
}
 
extension Image {
    init(systemHelper: SystemImageHelper) {
        self.init(systemName: systemHelper.rawValue)
    }
}
