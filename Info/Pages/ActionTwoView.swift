//
//  ActionTwoView.swift
//  Info
//
//  Created by Lisa Fellows on 3/10/25.
//

import SwiftUI

struct ActionTwoView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @EnvironmentObject private var settings: Settings

    var body: some View {
        Text(String.localization(key: .actionTwo))
        
            .navigationTitle(String.localization(key: .actionTwo))
            .toolbar {
                CustomToolbarItem(toolbarType: .playTime)
                CustomToolbarItem(toolbarType: .colorTheme)
            }

            .environmentObject(coordinator)
            .environmentObject(settings)
    }
}
