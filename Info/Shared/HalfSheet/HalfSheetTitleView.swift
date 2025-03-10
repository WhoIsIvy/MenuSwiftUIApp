//
//  HalfSheetTitleView.swift
//  Info
//
//  Created by Lisa Fellows on 3/8/25.
//

import SwiftUI

struct HalfSheetTitleView: View {
    let model: Model

    var body: some View {
        Label{
            Text(model.titleText)
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.dynamicText)
        } icon: {
            Image(systemHelper: model.imageIcon)
                .foregroundStyle(model.tintColor)
                .fontWeight(.bold)
        }
    }
}

extension HalfSheetTitleView {
    struct Model {
        let tintColor: Color
        let imageIcon: SystemImageHelper
        let titleText: String

        static let sample = Self(tintColor: .customBlue, imageIcon: .clock, titleText: "Play Time")
    }
}

#Preview {
    HalfSheetTitleView(model: .sample)
        .environmentObject(Settings())
}
