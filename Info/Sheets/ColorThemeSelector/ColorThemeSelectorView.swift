//
//  ColorThemeSelectorView.swift
//  Info
//
//  Created by Lisa Fellows on 3/8/25.
//

import SwiftUI

struct ColorThemeSelectorView: View {
    @EnvironmentObject var coordinator: Coordinator
    @EnvironmentObject var settings: Settings

    @State var width: Double = 0
    
    private let columns = Array(repeating: GridItem(.flexible()), count: 4)
    private var gridWidth: Double {
        let proposedWidth = width * 0.75
        return proposedWidth > 280 ? 280 : proposedWidth
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HalfSheetTitleBar(
                    model: .init(
                        tintColor: settings.colorTheme.color,
                        imageIcon: .paintpalette,
                        titleText: .localization(key: .colorTheme)
                    )
                )

                LazyVGrid(columns: columns) {
                    ForEach(ColorTheme.allCases) { theme in
                        ColorThemeChoiceView(choice: theme)
                    }
                }
                .frame(width: gridWidth)

                Spacer()
            }
            .background(.baseSecondary)
            .onAppear {
                width = geometry.size.width
            }

            .onChange(of: geometry.size) { _, newValue in
                width = newValue.width
            }
        }
        
        .environmentObject(coordinator)
        .environmentObject(settings)
    }
}

#Preview {
    ColorThemeSelectorView()
        .environmentObject(Coordinator())
        .environmentObject(Settings())
}
