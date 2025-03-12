//
//  ListNavLink+Model.swift
//  Info
//
//  Created by Lisa Fellows on 3/11/25.
//

import SwiftUI

extension ListNavLink {
    struct Model: Identifiable {
        let page: Page
        let text: String
        let secondaryText: String?
        let iconImage: SystemImageHelper
        let tintColor: Color

        let id = UUID()

        init(
            page: Page,
            text: String,
            secondaryText: String? = nil,
            iconImage: SystemImageHelper,
            tintColor: Color
        ) {
            self.page = page
            self.text = text
            self.secondaryText = secondaryText
            self.iconImage = iconImage
            self.tintColor = tintColor
        }

        static let sample = Model(
            page: .list("Sample"),
            text: "Value One",
            secondaryText: "Value Two",
            iconImage: .documentText,
            tintColor: .customBlue
        )
    }
}
