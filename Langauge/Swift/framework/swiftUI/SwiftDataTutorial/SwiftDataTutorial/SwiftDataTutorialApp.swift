//
//  SwiftDataTutorialApp.swift
//  SwiftDataTutorial
//
//  Created by 유승철 on 2/17/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataTutorialApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [PhotoModel.self, AlbumModel.self, UserModel.self])
    }
}
