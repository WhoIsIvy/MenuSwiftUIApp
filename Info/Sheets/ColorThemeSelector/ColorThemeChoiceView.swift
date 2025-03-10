//
//  ColorThemeChoiceView.swift
//  Info
//
//  Created by Lisa Fellows on 3/8/25.
//

import SwiftUI

struct ColorThemeChoiceView: View {
    @EnvironmentObject var settings: Settings
    let choice: ColorTheme
    
    private var isSelected: Bool {
        settings.colorTheme == choice
    }
    
    var body: some View {
        Button {
            settings.colorTheme = choice
        } label: {
            Text("")
                .frame(width: 40, height: 60)
                .background(choice.color)
                .clipShape(.circle)
                .overlay(
                    Circle()
                        .stroke(
                            isSelected ? .dynamicText : .clear,
                            lineWidth: 3.0
                        )
                )
        }
    }
}

#Preview {
    ColorThemeChoiceView(choice: .blue)
        .environmentObject(Settings())
}
