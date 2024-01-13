//
//  ContentView.swift
//  docDemo
//
//  Created by 유승철 on 1/13/24.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: docDemoDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

#Preview {
    ContentView(document: .constant(docDemoDocument()))
}
