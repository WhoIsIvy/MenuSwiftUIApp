//
//  CoordinatorView.swift
//  Info
//
//  Created by Lisa Fellows on 3/9/25.
//

import SwiftUI

struct CoordinatorView: View {
    @StateObject private var coordinator = Coordinator()
    @StateObject private var settings = Settings()

    @State private var editMode = EditMode.inactive

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.buildPage(.menu)
                .environment(\.editMode, $editMode)

                .navigationDestination(for: Page.self) { page in
                    coordinator.buildPage(page)
                }

                .sheet(item: $coordinator.sheet) { sheet in
                    coordinator.buildSheet(sheet)
                        .presentationDetents([.medium, .large])
                }
        }
        .environmentObject(coordinator)
        .environmentObject(settings)
        .tint(settings.colorTheme.color)
    }
}

#Preview {
    CoordinatorView()
}
