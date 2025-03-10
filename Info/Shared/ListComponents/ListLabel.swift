//
//  ListLabel.swift
//  Info
//
//  Created by Lisa Fellows on 3/9/25.
//

import SwiftUI

struct ListLabel: View {
    let model: Model

    var body: some View {
        Label {
            if let secondaryText = model.secondaryText {
                Group {
                    Text(model.text)
                        .foregroundStyle(.dynamicText)
                    + Text("\n\(secondaryText)")
                        .foregroundStyle(.dynamicTextSecondary)
                }
            } else {
                Text(model.text)
                    .foregroundStyle(.dynamicText)
            }
        } icon: {
            Image(systemHelper: model.iconImage)
                .foregroundStyle(model.tint)
        }
    }
}

extension ListLabel {
    struct Model {
        let text: String
        let secondaryText: String?
        let iconImage: SystemImageHelper
        let tint: Color
    }
}
