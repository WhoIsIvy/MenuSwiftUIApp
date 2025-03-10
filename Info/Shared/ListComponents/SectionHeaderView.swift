//
//  SectionHeaderView.swift
//  Info
//
//  Created by Lisa Fellows on 3/9/25.
//

import SwiftUI

struct SectionHeaderView: View {
    let headerTitle: String

    var body: some View {
        Text(headerTitle)
            .font(.system(size: 24, weight: .bold))
            .foregroundStyle(.dynamicText)
            .textCase(.none)
    }
}
