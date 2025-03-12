//
//  GroupText.swift
//  Info
//
//  Created by Lisa Fellows on 3/11/25.
//

import SwiftUI

struct GroupText: View {
    let primary: String
    let secondary: String

    var body: some View {
        Group {
            Text(primary)
                .foregroundStyle(.dynamicText)
            + Text("\n\(secondary)")
                .foregroundStyle(.dynamicTextSecondary)
        }
    }
}
