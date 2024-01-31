//
//  devoteApp.swift
//  devote
//
//  Created by 유승철 on 1/29/24.
//

import SwiftUI

@main
struct devoteApp: App {
    let persistenceController = PersistenceController.shared
    @AppStorage("isDrakMode") private var isDarkMode: Bool = false

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
