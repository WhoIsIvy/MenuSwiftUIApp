//
//  MenuView+SearchSectionView.swift
//  Info
//
//  Created by Lisa Fellows on 3/9/25.
//

import SwiftUI

extension MenuView {
    struct SearchSectionView: View {
        @EnvironmentObject private var settings: Settings
        @Binding var searchText: String

        let section: SearchSection
        
        var body: some View {
            Section(header: SectionHeaderView(headerTitle: sectionTitle)) {
                ForEach(models) {
                    ListNavLink(model: $0, useIndicator: false)
                }
            }
        }
    }
}

extension MenuView.SearchSectionView {
    enum SearchSection { case folder, files }

    private var sectionTitle: String {
        switch section {
        case .folder: return .localization(key: .folders)
        case .files: return .localization(key: .files)
        }
    }
    
    private var models: [ListNavLink.Model] {
        switch section {
        case .folder:
            return folderSearchResults(from: searchText)
        case .files:
            return fileSearchResults(from: searchText)
        }
    }
    
    private func folderSearchResults(from searchText: String) -> [ListNavLink.Model] {
        let models = Files.createListNavModels(
            from: settings.fileFolders,
            tintColor: settings.colorTheme.color
        )
        
        guard !searchText.isEmpty else { return models }
        return models.filter { $0.text.lowercased().contains(searchText.lowercased()) }
    }
    
    private func fileSearchResults(from searchText: String) -> [ListNavLink.Model] {
        settings.fileFolders.map {
            fileResults(searchText, shouldFilter: !searchText.isEmpty, inFolder: $0)
        }.flatMap { $0 }
    }

    private func fileResults(_ searchText: String, shouldFilter: Bool, inFolder folder: FileFolder) -> [ListNavLink.Model] {
        folder.affirmations.map {
            if shouldFilter, !$0.lowercased().contains(searchText.lowercased()) { return nil }
            return .init(
                page: .list($0),
                text: $0,
                secondaryText: folder.title,
                iconImage: .documentText,
                tintColor: settings.colorTheme.color
            )
        }.compactMap { $0 }
    }
}
