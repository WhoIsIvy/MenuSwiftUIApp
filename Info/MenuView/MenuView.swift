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

    @State private var searchText = ""
    @State private var isSearching = false
    
    var body: some View {
        List {
            if !isSearching {
                ActionSectionView(tintColor: settings.colorTheme.color)
                FolderSectionView()
            } else {
                SearchSectionView(searchText: $searchText, section: .folder)
                SearchSectionView(searchText: $searchText, section: .files)
            }
        }
        .listStyle(InsetGroupedListStyle())
        .searchable(text: $searchText, isPresented: $isSearching)

        .environmentObject(coordinator)
        .environmentObject(settings)

        .navigationTitle(String.localization(key: .menu))
        .toolbar {
            if !(editMode?.wrappedValue.isEditing ?? false) {
                CustomToolbarItem(toolbarType: .colorTheme)
            }
            EditButton()
        }
    }
}

#Preview {
    MenuView()
        .environmentObject(Coordinator())
        .environmentObject(Settings())
        .environment(\.editMode, .constant(.inactive))
}
