//
//  ListNavLink.swift
//  Info
//
//  Created by Lisa Fellows on 3/9/25.
//

import SwiftUI

struct ListNavLink: View {
    @Environment(\.editMode) private var editMode
    @EnvironmentObject private var coordinator: Coordinator

    let model: Model

    var body: some View {
        Button {
            action()
        } label: {
            ListLabel(model: .init(
                text: model.text,
                secondaryText: model.secondaryText,
                iconImage: model.iconImage,
                tint: model.tintColor
            ))
        }
    }

    private func action() {
        if let sheet = model.sheet {
            coordinator.presentSheet(sheet)
        } else if let page = model.page {
            coordinator.push(page: page)
        }
    }
}

extension ListNavLink {
    struct Model: Identifiable {
        let page: Page?
        let sheet: Sheet?

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
            sheet = nil
        }

        init(
            sheet: Sheet,
            text: String,
            secondaryText: String? = nil,
            iconImage: SystemImageHelper,
            tintColor: Color
        ) {
            self.sheet = sheet
            self.text = text
            self.secondaryText = secondaryText
            self.iconImage = iconImage
            self.tintColor = tintColor
            page = nil
        }

        static let sample = Model(
            page: .list,
            text: "Value One",
            secondaryText: "Value Two",
            iconImage: .documentText,
            tintColor: .customBlue
        )
    }
}

#Preview {
    ListNavLink(model: .sample)
        .environmentObject(Coordinator())
}
