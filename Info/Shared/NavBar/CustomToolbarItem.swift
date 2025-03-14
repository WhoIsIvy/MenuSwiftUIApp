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
            if let icon = toolbarType.iconImage {
                Label {} icon: { Image(systemHelper: icon) }
            }
        }
    }
}

extension CustomToolbarItem {
    private func coordinate() {
        if let page = toolbarType.pageType {
            coordinator.push(page: page)
        } else if let sheet = toolbarType.sheetType {
            coordinator.presentSheet(sheet)
        }
    }
}
