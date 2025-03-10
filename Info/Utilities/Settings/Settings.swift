//
//  Settings.swift
//  Info
//
//  Created by Lisa Fellows on 3/8/25.
//

import SwiftUI

class Settings: ObservableObject {
    @Published var colorTheme: ColorTheme = .blue
    @Published var fileFolders = Files.folders
    @Published var selectedAffirmationFolder: FileFolder?
}
