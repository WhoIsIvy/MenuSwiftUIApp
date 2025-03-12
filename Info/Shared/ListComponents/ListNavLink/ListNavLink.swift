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

    private var listLabel: ListLabel {
        ListLabel(model: .init(
            text: model.text,
            secondaryText: model.secondaryText,
            iconImage: model.iconImage,
            tint: model.tintColor
        ))
    }
}

#Preview {
    ListNavLink(model: .sample, useIndicator: true)
        .environmentObject(Coordinator())
}
