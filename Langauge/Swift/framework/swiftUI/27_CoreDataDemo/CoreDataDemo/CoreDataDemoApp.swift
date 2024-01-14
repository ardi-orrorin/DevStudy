//
//  CoreDataDemoApp.swift
//  CoreDataDemo
//
//  Created by 유승철 on 1/14/24.
//

import SwiftUI

@main
struct CoreDataDemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
