//
//  RestApiTestApp.swift
//  RestApiTest
//
//  Created by 유승철 on 2/11/24.
//

import SwiftUI

@main
struct RestApiTestApp: App {
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()

        }
        .environment(
            \.managedObjectContext,
             persistenceController.container.viewContext
        )
    }
}
