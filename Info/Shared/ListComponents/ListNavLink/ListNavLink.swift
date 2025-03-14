//
//  ListNavLink.swift
//  Info
//
//  Created by Lisa Fellows on 3/9/25.
//

import SwiftUI

struct ListNavLink: View {
    @EnvironmentObject private var coordinator: Coordinator

    let model: Model
    let useIndicator: Bool

    var body: some View {
        if useIndicator {
            NavigationLink(value: model.page) {
                listLabel
            }
        } else {
            Button {
                coordinator.push(page: model.page)
            } label: {
                listLabel
            }
        }
    }
}

extension ListNavLink {
    private var listLabel: ListLabel {
        ListLabel(model: .init(
            text: model.text,
            secondaryText: model.secondaryText,
            iconImage: model.iconImage,
            tint: model.tintColor
        ))
    }
}

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
//#Preview {
//    ListNavLink(model: .sample, useIndicator: true)
//        .environmentObject(Coordinator())
//}
