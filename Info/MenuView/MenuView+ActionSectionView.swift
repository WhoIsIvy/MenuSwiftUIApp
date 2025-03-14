//
//  MenuView+ActionSectionView.swift
//  Info
//
//  Created by Lisa Fellows on 3/9/25.
//

import SwiftUI

extension MenuView {
    struct ActionSectionView: View {
        let isEditing: Bool
        let tintColor: Color

        var body: some View {
            Section {
                ForEach(models) {
                    ListNavLink(model: $0, useIndicator: !isEditing)
                }
            }
        }
    }
}

extension MenuView.ActionSectionView {
    private var models: [ListNavLink.Model] {
        [.init(
            page: .actionOne,
            text: .localization(key: .actionOne),
            iconImage: .tv,
            tintColor: tintColor
        ),
         .init(
            page: .actionTwo,
            text: .localization(key: .actionTwo),
            iconImage: .keyboard,
            tintColor: tintColor
         )]
    }

}
