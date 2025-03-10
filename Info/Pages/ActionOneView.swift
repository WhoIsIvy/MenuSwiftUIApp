//
//  ActionOneView.swift
//  Info
//
//  Created by Lisa Fellows on 3/10/25.
//

import SwiftUI

struct ActionOneView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject private var settings: Settings

    var body: some View {
        Text(String.localization(key: .actionOne))
        
            .navigationTitle(String.localization(key: .actionOne))
            .toolbar {
                CustomToolbarItem(toolbarType: .playTime)
                CustomToolbarItem(toolbarType: .cycleSpeed)
                CustomToolbarItem(toolbarType: .colorTheme)
            }

            .environmentObject(coordinator)
            .environmentObject(settings)
    }
}
