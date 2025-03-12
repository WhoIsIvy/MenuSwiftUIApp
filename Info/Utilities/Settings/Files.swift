//
//  Files.swift
//  Info
//
//  Created by Lisa Fellows on 3/9/25.
//

import SwiftUI

struct FileFolder: Identifiable {
    let title: String
    let affirmations: [String]
    let id = UUID()
}

enum Files {
    static let folders = [
        FileFolder(
            title: "Folder One",
            affirmations: [
                "File One",
                "File Two",
                "File Three"
            ]
        ),
        FileFolder(
            title: "Folder Two",
            affirmations: [
                "File One",
                "File Two",
                "File Three"
            ]
        ),
        FileFolder(
            title: "Folder Three",
            affirmations: [
                "File One",
                "File Two",
                "File Three"
            ]
        ),
    ]

    static func createListNavModels(from list: [FileFolder], tintColor: Color) -> [ListNavLink.Model] {
        list.map { .init(page: .list($0.title), text: $0.title, iconImage: .folder, tintColor: tintColor) }
    }
}
