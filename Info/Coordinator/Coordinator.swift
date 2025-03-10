//
//  Coordinator.swift
//  Info
//
//  Created by Lisa Fellows on 3/9/25.
//

import SwiftUI

// https://www.swiftanytime.com/blog/coordinator-pattern-in-swiftui

class Coordinator: ObservableObject {
    @Published var path: NavigationPath = NavigationPath()
    @Published var sheet: Sheet?

    func push(page: Page) {
        path.append(page)
    }

    func pop() {
        path.removeLast()
    }

    func popToRoot() {
        path.removeLast(path.count)
    }

    func presentSheet(_ sheet: Sheet) {
        self.sheet = sheet
    }

    func dismiss() {
        self.sheet = nil
    }

    @ViewBuilder
    func buildPage(_ page: Page, folder: FileFolder? = nil) -> some View {
        switch page {
        case .menu: MenuView()
        case .actionOne: ActionOneView()
        case .actionTwo: ActionTwoView()
        case .list: ListView()
        }
    }

    @ViewBuilder
    func buildSheet(_ sheet: Sheet, folder: FileFolder? = nil) -> some View {
        switch sheet {
        case .colorTheme: ColorThemeSelectorView()
        default: EmptyView()
        }
    }
}
