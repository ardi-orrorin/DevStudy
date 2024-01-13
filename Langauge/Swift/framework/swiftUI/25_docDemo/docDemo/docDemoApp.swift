//
//  docDemoApp.swift
//  docDemo
//
//  Created by 유승철 on 1/13/24.
//

import SwiftUI

@main
struct docDemoApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: docDemoDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
