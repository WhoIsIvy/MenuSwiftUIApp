//
//  MenuView+FolderSectionView.swift
//  Info
//
//  Created by Lisa Fellows on 3/9/25.
//

import SwiftUI

extension MenuView {
    struct FolderSectionView: View {
        @EnvironmentObject private var settings: Settings

        var body: some View {
            Section(header: SectionHeaderView(headerTitle: .localization(key: .folders))) {
                ForEach(models(from: settings)) {
                    ListNavLink(model: $0)
                }
                .onMove(perform: moveAffirmationFolder)
            }
        }

        private func models(from settings: Settings) -> [ListNavLink.Model] {
            Files.createListNavModels(
                from: settings.fileFolders,
                for: .sheet,
                tintColor: settings.colorTheme.color
            )
        }

        private func moveAffirmationFolder(fromOffsets: IndexSet, toOffset: Int) {
            settings.fileFolders.move(fromOffsets: fromOffsets, toOffset: toOffset)
        }
    }
}
