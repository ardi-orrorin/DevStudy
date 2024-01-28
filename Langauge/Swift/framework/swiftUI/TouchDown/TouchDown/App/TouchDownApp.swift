//
//  TouchDownApp.swift
//  TouchDown
//
//  Created by 유승철 on 1/25/24.
//

import SwiftUI

@main
struct TouchDownApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Shop())
        }
    }
}
