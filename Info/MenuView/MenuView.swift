//
//  ContentView.swift
//  Info
//
//  Created by Lisa Fellows on 3/7/25.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject private var settings: Settings
    
    @Environment(\.editMode) var editMode

    @State private var isSearching = false
    @State private var searchText = ""

    var body: some View {
        List {
            if !isSearching {
                Group {
                    ActionSectionView(isEditing: isEditing, tintColor: settings.colorTheme.color)
                    FolderSectionView(isEditing: isEditing)
                }
                .listRowBackground(Color.baseSecondary)
                
            } else {
                Group {
                    SearchSectionView(searchText: $searchText, section: .folder)
                    SearchSectionView(searchText: $searchText, section: .files)
                }
                .listRowBackground(Color.baseSecondary)
            }
        }
        .listStyle(InsetGroupedListStyle())
        .scrollContentBackground(.hidden)
        .background(Color.basePrimary)
        .searchable(text: $searchText, isPresented: $isSearching)

        .environmentObject(coordinator)
        .environmentObject(settings)

        .navigationTitle(String.localization(key: .menu))
        .toolbar {
            if !isEditing {
                CustomToolbarItem(toolbarType: .colorTheme)
            }
            EditButton()
        }

        .onChange(of: coordinator.pages) { _, new in
            updateSearchbar(with: new.last)
        }
    }
}

extension MenuView {
    private var isEditing: Bool {
        editMode?.wrappedValue.isEditing ?? false
    }

    func updateSearchbar(with pageInfo: Page?) {
        if isSearching && searchText.isEmpty {
            switch pageInfo {
            case .list(let string):
                searchText = string
            default: return
            }
        }
    }
}
