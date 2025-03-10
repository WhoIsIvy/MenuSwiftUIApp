//
//  SheetDismissButton.swift
//  Info
//
//  Created by Lisa Fellows on 3/8/25.
//

import SwiftUI

struct SheetDismissButton: View {
    @EnvironmentObject var coordinator: Coordinator

    let tintColor: Color

    var body: some View {
        HStack {
            Spacer()
            Button {
                coordinator.dismiss()
            } label: {
                Image(systemHelper: .xmark)
                    .foregroundStyle(tintColor)
                    .imageScale(.medium)
                    .fontWeight(.bold)
                    .frame(width: 44, height: 44)
            }
        }
        .padding(.trailing)
    }
}

#Preview {
    SheetDismissButton(tintColor: .customGreen)
        .environmentObject(Coordinator())
}
