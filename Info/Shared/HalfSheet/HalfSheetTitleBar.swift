//
//  SheetTitleBar.swift
//  Info
//
//  Created by Lisa Fellows on 3/8/25.
//

import SwiftUI

struct HalfSheetTitleBar: View {
    let model: HalfSheetTitleView.Model

    var body: some View {
        HStack {
            Spacer()
            HalfSheetTitleView(model: model)
            SheetDismissButton(tintColor: model.tintColor)
        }
        .padding([.top, .leading])
        .padding(.bottom, 24)
    }
}

//#Preview {
//    HalfSheetTitleBar(model: .sample)
//        .environmentObject(Coordinator())
//        .environmentObject(Settings())
//}

