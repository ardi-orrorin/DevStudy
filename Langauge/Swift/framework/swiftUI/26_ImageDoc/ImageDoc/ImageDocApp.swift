//
//  ImageDocApp.swift
//  ImageDoc
//
//  Created by 유승철 on 1/13/24.
//

import SwiftUI

@main
struct ImageDocApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: ImageDocDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
