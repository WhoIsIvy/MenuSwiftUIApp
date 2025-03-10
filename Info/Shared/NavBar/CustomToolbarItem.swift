//
//  CustomToolbarItem.swift
//  Info
//
//  Created by Lisa Fellows on 3/9/25.
//

import SwiftUI

struct CustomToolbarItem: View {
    @EnvironmentObject var coordinator: Coordinator

    let toolbarType: ToolbarType

    var body: some View {
        Button {
            coordinate()
        } label: {
            Label {} icon: { if let image = image { image } }
        }
    }

    private var image: Image? {
        guard let icon = toolbarType.iconImage else { return nil }
        return Image(systemHelper: icon)
    }

    private func coordinate() {
        if let page = toolbarType.pageType {
            coordinator.push(page: page)
        } else if let sheet = toolbarType.sheetType {
            coordinator.presentSheet(sheet)
        }
    }
}
